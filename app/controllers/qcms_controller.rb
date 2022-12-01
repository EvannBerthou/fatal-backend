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
    params.permit!
    qcm = get_qcm(params[:id])
    raise 'Error lors de la mise à jour des attributes' unless qcm.update(params[:qcm])

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
end
