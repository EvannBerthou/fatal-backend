module BashModule
    private
    save_folder = Rails.configuration.amc[:save_folder]

    def AMC_create_dir(qcm)
        `mkdir #{save_folder}/#{qcm.id} #{save_folder}/#{qcm.id}/data`
    end

    def AMC_write_qcm_file(qcm)
      `echo "#{qcm.toTxt}" \
      > #{save_folder}/#{qcm.id}/#{qcm.id}.txt`
    end

    def AMC_generation(qcm)
        `cd #{save_folder}/#{qcm.id}/ && auto-multiple-choice prepare --mode s \
        --prefix . \
        #{qcm.id}.txt \
        --out-sujet DOC-sujet.pdf \
        --out-corrige DOC-corrige.pdf \
        --out-calage DOC-calage.xy \
        --filter plain \
        --data ./data >&2`
    end

    def AMC_move_pdf_to_downloadable_folder(qcm)
        `mv #{save_folder}/#{qcm.id}/DOC-sujet.pdf \
        #{save_folder}/#{qcm.id}.pdf`
    end
end