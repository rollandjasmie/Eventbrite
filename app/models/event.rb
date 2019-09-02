class Event < ApplicationRecord
	has_many :attandances
	has_many :users, through: :attandances
	belongs_to :administre, class_name: "User"
	has_one_attached :avatar

	validates :start_date, presence: true, if: :is_valid_date
  validates :duration, presence: true, numericality: {greater_than: 0}, if: :duration_test
  validates :title, presence: true, length: {in: 5..140 }
  validates :description, presence: true, length: {in: 20..500 }
  validates :price, presence: true
  validates_inclusion_of :price, in: 0..1000, message:'Le prix doit être de 0 à 1000'
  validates :location, presence: true

  def is_valid_date
    if start_date.nil? || DateTime.now > start_date
      errors.add(:start_date, :not_date ,{message: 'Un evenement doits être dans le futur'})
    end
  end
  def duration_test
    if duration.nil? || (duration % 5 != 0)
      errors.add(:duration, :not_pos5, {message:'Le durée doits être positif et multiple de 5'})
    end
  end

	def end_date
    	self.start_date + (self.duration).minute
  	end
  	def is_free?
  		self.price == 0
  	end
end
