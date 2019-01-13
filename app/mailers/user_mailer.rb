class UserMailer < ApplicationMailer
  default from: "contact@bikeberlin2018.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'mail@michaeldooney.net',
         subject: "A new contact form message from #{name} via BikeBerlin2018")
  end

  def welcome(user)
    @appname = "Bike Berlin 2018"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end
end
