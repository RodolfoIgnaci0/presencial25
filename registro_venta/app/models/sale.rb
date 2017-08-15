class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: %w('uno' 'dos' 'tres' 'cuatro')
  validates :value, numericality: true
  validates :discount, numericality: { only_integer: true, less_than_or_equal_to: 40 }
end
