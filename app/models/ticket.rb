class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :name, :presence => true, :length => { :minimum => 6 }
  validates :email_address, :presence => true 
  validates :price, :presence => true
  validates :event_id, :presence => true
  validate :valid_price
  
  def valid_price
    if event != nil and event.price_low > price
      errors.add('Ticket price', 'is too low')
    end
    if event != nil and event.price_high < price
      errors.add('Ticket price', 'is too high')
    end
  end
end