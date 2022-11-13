module BashModule
    private

    def AMC_create_dir(qcm)
        `mkdir #{Rails.configuration.amc[:save_folder]}/#{qcm.id} #{Rails.configuration.amc[:save_folder]}/#{qcm.id}/data`
    end

    def AMC_write_qcm_file(qcm)
      `echo "#{qcm.toTxt}" \
      > #{Rails.configuration.amc[:save_folder]}/#{qcm.id}/#{qcm.id}.txt`
    end

    def AMC_generation(qcm)
        `cd #{Rails.configuration.amc[:save_folder]}/#{qcm.id}/ && auto-multiple-choice prepare --mode s \
        --prefix . \
        #{qcm.id}.txt \
        --out-sujet DOC-sujet.pdf \
        --out-corrige DOC-corrige.pdf \
        --out-calage DOC-calage.xy \
        --filter plain \
        --data ./data >&2`
    end

    def AMC_move_pdf_to_downloadable_folder(qcm)
        `mv #{Rails.configuration.amc[:save_folder]}/#{qcm.id}/DOC-sujet.pdf \
        #{Rails.configuration.amc[:pdf_folder]}/#{qcm.id}.pdf`
    end
end