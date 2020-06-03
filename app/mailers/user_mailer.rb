class UserMailer < ApplicationMailer
  default from: 'findnewfriends.thp@gmail.com'


def welcome_email(user)
  puts "Welcome email method was executed"
  #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
  @user = user

  #on définit une variable @url qu'on utilisera dans la view d’e-mail
  @url  = 'https://e-commerce-chatons-fnf.herokuapp.com/'

  # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
  mail(to: @user.email, subject: 'Bienvenue chez nous !')
end

def order_confirmation(user, order)
  @user = user
  @order = order
  mail(to: @user.email, subject: 'Order has been received')
end

end
