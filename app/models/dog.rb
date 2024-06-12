class Dog < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { minimum: 2, maximum: 30 }
  validates :city, presence: true
  validates :description, presence: true
  validates :breed, presence: true
end
