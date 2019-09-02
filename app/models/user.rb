class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :attandances
	has_many :users, through: :attandances
	has_many :administres, foreign_key: "", class_name: "Event"
	after_create :welcome_send
  has_one_attached :photo

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
