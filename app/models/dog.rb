class Dog < ApplicationRecord
  include Geocoder


  geocoded_by :city
   after_validation :geocode, if: :will_save_change_to_city?

  belongs_to :user
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { minimum: 2, maximum: 30 }
  validates :city, presence: true
  validates :description, presence: true
  validates :breed, presence: true
end
