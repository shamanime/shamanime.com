class PagesController < ApplicationController
  def contact
    @title =  "Contact"
    @contact = Contact.new(:id =>1)
  end
  
  def send_contact
    @contact = Contact.new(params[:contact])
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contato_path, :flash => { :success => 'Message sent successfully!' } }
        format.js { render :partial => "contact/success" }
      else
        format.html { redirect_to contato_path, :flash => { :error => 'There was a problem sending your message!' } }
        format.js { render :partial => "contact/error" }
      end
    end
  end
end
