require "rails_helper"

RSpec.describe "Flights Index Page" do
  before :each do
    @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver" )
    @flight_2 = Flight.create!(number: "1922", date: "11/25/20", departure_city: "New York", arrival_city: "Tampa" )
    @flight_3 = Flight.create!(number: "1888", date: "11/30/20", departure_city: "Dallas", arrival_city: "Seattle" )
  end
  describe "When I visit the flights index page" do
    it "I see each flight in the system including it's attributes and flights listed in alphabetical order by departure city" do

      visit "/flights"

      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content(@flight_1.number)
        expect(page).to have_content(@flight_1.departure_city)
        expect(page).to have_content(@flight_1.arrival_city)
      end

      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content(@flight_2.number)
        expect(page).to have_content(@flight_2.departure_city)
        expect(page).to have_content(@flight_2.arrival_city)
      end

      within("#flight-#{@flight_3.id}") do
        expect(page).to have_content(@flight_3.number)
        expect(page).to have_content(@flight_3.departure_city)
        expect(page).to have_content(@flight_3.arrival_city)
      end

      expect(@flight_1.departure_city).to appear_before(@flight_2.departure_city)
      expect(@flight_3.departure_city).to appear_before(@flight_2.departure_city)
    end
  end
end


  # When I visit the flights index page
  # I see each flight in the system including its number, departure city, and arrival city
  # And I see that flights are listed in alphabetical order by departure city (A - Z)
