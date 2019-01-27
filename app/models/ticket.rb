class Ticket < ApplicationRecord
  belongs_to :event
  
  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :email_address, :presence => true 
  validates :price, :presence => true
  validate :valid_price
  
  def valid_price
    if event.price_low > price
      errors.add('Cena biletu', 'jest za niska')
    end
    if event.price_high < price 
      errors.add('Cena biletu', 'jest za wysoka')
    end
  end
end