class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def delete_email(user)
    @user = user
    @url  = 'http://example.com/login' # MM6: Not sure why you are giving them the loging link if their account was just deleted unless it's the same as sign up.
    mail(to: @user.email, subject: 'You got booted son!')
  end

end
