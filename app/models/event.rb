class Event < ApplicationRecord
  belongs_to :event_category

  validates :event_category, :title, :location, :start_at, :ticket_price, :ticket_quantity, presence: true
end
