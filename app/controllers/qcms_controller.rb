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
    generate_qcm_txt(params[:id])
    render json: get_qcm(params[:id])
  end

  private

  def get_all_qcms_of_user
    Qcm.includes(:questions).where(user_id: current_user.id) #.to_json(:include => :questions)
  end

  def get_qcm(id)
    qcm = Qcm.includes(:questions).find_by(id: id)
    raise 'Le QCM n\'exsite pas' if qcm.nil?
    raise 'Vous n\'êtes pas le propriétaire du QCM' if qcm.user_id != current_user.id

    qcm
  end

  def generate_qcm_txt(id)
    qcm = Qcm.includes(:questions).find_by(id: id)
    raise 'Le QCM n\'exsite pas' if qcm.nil?
    raise 'Vous n\'êtes pas le propriétaire du QCM' if qcm.user_id != current_user.id
  
    generating_command = "auto-multiple-choice prepare --mode s --prefix . #{qcm.id}.txt     --out-sujet DOC-sujet.pdf     --out-corrige DOC-corrige.pdf     --out-calage DOC-calage.xy --filter plain --data ./data"

    texte = qcm.toTxt()

    `mkdir MC-Projects/#{qcm.id} MC-Projects/#{qcm.id}/data`
    `echo "#{texte}" > MC-Projects/#{qcm.id}/#{qcm.id}.txt`
    `cd MC-Projects/#{qcm.id}/ && #{generating_command} >&2` 

  end
end
