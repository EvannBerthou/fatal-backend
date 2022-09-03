class QcmsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: get_all_qcms_of_user
  end

  def show
    render json: get_qcm(params[:id])
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
    send_file('README.md')
  end

  private

  def get_all_qcms_of_user
    Qcm.includes(:questions).where(user_id: current_user.id)
  end

  def get_qcm(id)
    qcm = Qcm.includes(:questions).find_by(id: id)

    raise 'Le QCM n\'exsite pas' if qcm.nil?
    raise 'Vous n\'êtes pas le propriétaire du QCM' if qcm.user_id != current_user.id

    qcm
  end
end
