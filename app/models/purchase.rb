class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  enum status: [:complete, :cancelled]
  validates :event, presence: true
  validate :ticket_quantity_enough
  
  def ticket_quantity_enough
    active_purchases = Purchase.complete.joins(:event).where(events: { id: event.id})
    if active_purchases.count + ticket_quantity > event.ticket_quantity
      errors.add(:base, 'This event is sold out.')
    end
  end
end
