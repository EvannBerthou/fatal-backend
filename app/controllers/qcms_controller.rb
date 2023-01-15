require 'qcms_module'
class QcmsController < ApplicationController
  before_action :authenticate_user!
  include QcmsModule

  def index
    render json: get_all_qcms_of_user(), include: [categories: { include: :questions }]
  end

  def show
    render json: get_qcm(params[:id]), include: [categories: { include: [questions: {include: :reponses} ] }]
  end

  def create
    created_qcm = Qcm.create(titre: params[:titre],
                             entete: params[:entete],
                             is_randomized: params[:is_randomized],
                             user_id: current_user.id)
    render json: created_qcm
  end

  def update
    qcm = get_qcm(params[:id])
    raise 'Error lors de la mise à jour des attributes' unless qcm.update(qcm_param)
    render json: qcm
  end

  def destroy
    Qcm.destroy(params[:id])
  end

  def generate
    render json: generate_qcm_txt(params[:id])
  end

  def recent
    render json: get_most_recent_qcms(), include: [categories: { include: :questions }]
  end

  private

  def qcm_param
    # On filtre les paramètres qui sont white-list. Uniquement ceux qui indispensable à l'update
    permitted = params.require(:qcm).permit(:id, :entete, :is_randomized, :titre, categories: [
      :id, :qcm_id, :texte, questions: [
        :id, :texte, :typedequestion, reponses: [:id, :texte, :points, :isRight]
      ]
    ]).to_h

    # Il faut renommer les clés pour que RoR puisse les utiliser
    permitted.deep_transform_keys do |key|
      case key
      when 'categories' then 'categories_attributes'
      when 'questions' then 'questions_attributes'
      when 'reponses' then 'reponses_attributes'
      else key
      end
    end
  end
end
