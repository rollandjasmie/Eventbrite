class AttandanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def participant_email(attandance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attandance = attandance 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attandance.event.administre.email, subject: 'Bienvenue chez nous !') 
  end
end
