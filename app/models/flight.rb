class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.order_by_departure
    order(departure_city: :asc)
  end

  def eighteen_and_older
    passengers.where('age >= ?', 18)
  end

  def average_age_of_adult_passengers
    eighteen_and_older.average(:age)
  end
end
