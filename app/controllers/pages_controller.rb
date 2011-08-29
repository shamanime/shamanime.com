class PagesController < ApplicationController
  def contact
    @title = "Contact"
    @contact = Contact.new(:id =>1)
  end
end