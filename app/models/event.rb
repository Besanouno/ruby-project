class Event < ApplicationRecord
  has_many :tickets
  
  validates :artist, :presence => true
  validates :price_low, :presence => true, :numericality => true 
  validates :price_high, :presence => true, :numericality => true
  validates :event_date, :presence => true
  validate :event_date_not_from_past
  validate :prices_are_greater_than_zero
  validate :price_high_greater_than_price_low
  
  def event_date_not_from_past
    if event_date < Date.today
      errors.add('Data wydarzenia', 'nie może być z przeszłości')
    end
  end
  
  def prices_are_greater_than_zero
    if price_low < 0 or price_high < 0
      errors.add('Ceny biletów', 'muszą być dodatnie')
    end
  end
  
  def price_high_greater_than_price_low 
    if price_low > price_high
      errors.add('Cena najtańszego biletu', 'nie może być mniejsza od ceny najdroższego')
    end
  end
end
