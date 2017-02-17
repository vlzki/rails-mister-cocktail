class Cocktail < ApplicationRecord

  has_attachments :photos, maximum: 2

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
