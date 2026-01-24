class Flight < ApplicationRecord
  belongs_to :departure_airport,
             class_name: "Airport"

  belongs_to :arrival_airport,
             class_name: "Airport"
  has_many :bookings

  def description
    "#{self.departure_airport.name} → #{self.arrival_airport.name} #{self.departure_date}"
  end
end
