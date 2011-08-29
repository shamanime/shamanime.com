# encoding: utf-8
class Site < ActionMailer::Base
 default :from => "jefferson@shamanime.com"

 def contact(params)
   @params = params
   mail :from => @params[:email],
        :to => "jefferson@shamanime.com",
        :subject => "Contact mail sent from shamanime.com"
 end
end