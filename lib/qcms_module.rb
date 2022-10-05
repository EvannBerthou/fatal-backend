require "bash_module"
module QcmsModule
    include BashModule
    private

    def get_qcm(id)
        qcm = Qcm.includes(:questions).find_by(id: id)
    
        raise 'Le QCM n\'exsite pas' if qcm.nil?
        raise 'Vous n\'êtes pas le propriétaire du QCM' if qcm.user_id != current_user.id
    
        qcm
    end

    def get_all_qcms_of_user()
      Qcm.includes(:questions).where(user_id: current_user.id)
    end
  
    def generate_qcm_txt(id)
      qcm = get_qcm(id)

      AMC_create_dir(qcm)
      AMC_write_qcm_file(qcm)
      AMC_generation(qcm)
      AMC_move_pdf_to_downloadable_folder(qcm)
      $?
    end

end
