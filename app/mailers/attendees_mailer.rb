class AttendeesMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'
 


    def attend_email(event)
        
      @user = event 
  
      @url  = 'http://monsite.fr/login' 
  
      mail(to: @user.event.admin.email, subject: 'inscription d un participant  !') 

    end
end
