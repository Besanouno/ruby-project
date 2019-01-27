class Event < ApplicationRecord
  has_many :tickets
  
  validates :artist, :presence => true
  validates :price_low, :presence => true, :numericality => true 
  validates :price_high, :presence => true, :numericality => true
  validates :event_date, :presence => true
  
  def event_date_not_from_past
    if event_date < Date.today
      errors.add('Data wydarzenia', 'nie może być z przeszłości')
    end
  end
end
