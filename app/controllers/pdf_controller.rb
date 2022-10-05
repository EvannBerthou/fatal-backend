require 'qcms_module'
class PdfController < ApplicationController
    include QcmsModule

    def show
        qcm = get_qcm(params[:id])

        filename = "#{Rails.configuration.amc[:pdf_folder]}/#{qcm.id}.pdf"
        File.open(filename, 'r') do |f|
          send_data f.read.force_encoding('BINARY'), :filename => qcm.id.to_s, :type => "application/pdf", :disposition => "attachment"
        end
    end
end
