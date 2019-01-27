class Event < ApplicationRecord
  has_many :tickets
  
  validates :artist, :presence => true
  validates :price_low, :presence => true, :numericality => true 
  validates :price_high, :presence => true, :numericality => true
  validates :event_date, :presence => true
end
