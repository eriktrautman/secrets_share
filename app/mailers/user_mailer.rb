class UserMailer < ActionMailer::Base
  default from: "erik@example.com"

  def welcome_email(user)
    puts "I SENT AN EMAIL"
    @user = user
    @url = "http://localhost:3000/login/new"
    mail(to: user.email, subject: "I RULE and now you should share your seeeeeeecrets with me")
  end


end
