class Monster < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :attacks
  has_many :victims, through: :attacks
end
