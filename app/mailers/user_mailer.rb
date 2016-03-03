class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def delete_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You got booted son!')
  end

end
