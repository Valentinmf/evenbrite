# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_email(user)
    @user = user

    @url  = 'http://the-eventbrite-project.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def attendance_email(user)
    @user = user

    @url  = 'http://the-eventbrite-project.fr/login'

    mail(to: @user.email, subject: 'Voici votre reservation !')
  end
end
