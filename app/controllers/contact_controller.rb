class ContactController < ApplicationController
  def contact
    @contact = Contact.new(params[:contact])
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contato_path, :flash => { :success => 'Message sent successfully!' } }
        format.js { render :partial => "success" }
      else
        format.html { redirect_to contato_path, :flash => { :error => 'There was a problem sending your message!' } }
        format.js { render :partial => "error" }
      end
    end
  end
end
