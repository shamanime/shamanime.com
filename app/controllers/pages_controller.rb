class PagesController < ApplicationController
  def contact
    @contact = Contact.new(:id =>1)
  end
end