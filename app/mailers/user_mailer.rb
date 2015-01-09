class UserMailer < ApplicationMailer
  def review_alert(user)
    @user = user
    mail to: @user.email, subject: "A review has been posted to your weather"

  end
end
