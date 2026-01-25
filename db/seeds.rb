# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Define an array of airport data with name and IATA airport codes
airports = [
  { name: "Heathrow", code: "LHR" },
  { name: "Gatwick",  code: "LGW" },
  { name: "JFK",      code: "JFK" }
]

# Iterate through each airport and create records in the database
airports.each do |attrs|
  Airport.create!(attrs)
end


# Retrieve airport records from the database by their IATA codes
lhr = Airport.find_by!(code: "LHR")
jfk = Airport.find_by!(code: "JFK")
lgw = Airport.find_by!(code: "LGW")

# Define an array of flight data, specifying departure and arrival airports, and prices
flights = [
  {
    departure_airport: lhr,
    arrival_airport: jfk,
    departure_date: "2026-01-21",
    price: 599
  },
  {
    departure_airport: jfk,
    arrival_airport: lhr,
    departure_date: "2026-01-22",
    price: 625
  },
  {
    departure_airport: lgw,
    arrival_airport: jfk,
    departure_date: "2026-01-23",
    price: 549
  }
]

# Iterate through each flight and create records in the database
flights.each do |attrs|
  Flight.create!(attrs)
end
