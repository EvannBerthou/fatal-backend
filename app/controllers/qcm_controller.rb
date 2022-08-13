class QcmController < ApplicationController
  # TODO: Temporaire, permet de pouvoir faire des requêts directement à l'API
  # tant qu'on est pas encore ne mode API ONLY
  skip_before_action :verify_authenticity_token

  def show
    id = params[:id]
    qcm = Qcm.find(id)
    render json: qcm, include: :user
  end

  def create
    created_qcm = Qcm.create(titre: params[:titre],
                             entete: params[:entete],
                             is_randomized: params[:is_randomized],
                             user_id: params[:user_id])
    render json: created_qcm
  end

  def update
    params.permit!
    qcm = Qcm.find(params[:id])
    raise 'Error lors de la mise à jour des attributes' unless qcm.update(params[:qcm])

    render json: qcm
  end

  def destroy
    Qcm.destroy(params[:id])
  end
end
