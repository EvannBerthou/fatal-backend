require 'qcms_module'
class PdfController < ApplicationController
    before_action :authenticate_user!
    include QcmsModule

    def show
        qcm = get_qcm(params[:id])

        filename = "#{Rails.configuration.amc[:pdf_folder]}/#{qcm.id}.pdf"
        if File.exists?(filename)
          File.open(filename, 'r') do |f|
            send_data f.read.force_encoding('BINARY'), :filename => qcm.id.to_s, :type => "application/pdf", :disposition => "attachment"
          end
        else
          send_data "", :filename => qcm.id.to_s, :type => "application/pdf", :disposition => "attachment"
        end
    end
end
