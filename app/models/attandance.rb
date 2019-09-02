class Attandance < ApplicationRecord
	belongs_to :user
	belongs_to :event
	after_create :welcome_bienvenu

  def welcome_bienvenu
    AttandanceMailer.participant_email(self).deliver_now
  end
  

end
