require "rails_helper"

RSpec.describe "Flights Show Page" do
  before :each do
    @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver", time: "4:44PM" )
    # @flight_2 = Flight.create!(number: "1922", date: "11/25/20", departure_city: "New York", arrival_city: "Tampa", time: "8:07AM" )
    # @flight_3 = Flight.create!(number: "1888", date: "11/30/20", departure_city: "Dallas", arrival_city: "Seattle" time: "10:55 AM" )
    @passenger_1 = @flight_1.passengers.create!(name: "Katy La Tour", age: 29)
    @passenger_2 = @flight_1.passengers.create!(name: "Juls Feliciano", age: 32)
    @passenger_3 = @flight_1.passengers.create!(name: "Joe Shmoe", age: 14)
    @passenger_4 = @flight_1.passengers.create!(name: "Karen Shmaren", age: 18)
  end

  describe "When I visit a flight's show page" do
    it "Shows all information for a flight, names of all adult passengers and average age of adult pasengers" do

      visit "/flights/#{@flight_1.id}"

      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content(@flight_1.number)
        expect(page).to have_content(@flight_1.date)
        expect(page).to have_content(@flight_1.time)
        expect(page).to have_content(@flight_1.departure_city)
        expect(page).to have_content(@flight_1.arrival_city)
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to have_content(@passenger_4.name)
        expect(page).to_not have_content(@passenger_3.name)
        expect(page).to have_content("Average Age of Adult Passengers: 26.33")
      end
    end
  end
end
