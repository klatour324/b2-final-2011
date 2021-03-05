require "rails_helper"

RSpec.describe "Flights Show Page" do
  before :each do
    @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver", time: "4:44PM" )
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

    it "can remove a passenger from a flight" do
      visit "/flights/#{@flight_1.id}"

      within("#flight-#{@flight_1.id}") do
        expect(page).to have_button("Remove Passenger")
        expect(page).to have_content(@passenger_1.name)
      end
      within("#flight-#{@flight_1.id}") do
        expect(page).to have_button("Remove Passenger")
        expect(page).to have_content(@passenger_2.name)
      end

      within("#flight-#{@flight_1.id}") do
        expect(page).to have_button("Remove Passenger")
        expect(page).to have_content(@passenger_4.name)
        click_button("Remove Passenger", match: :first)
      end
      expect(current_path).to eq "/flights/#{@flight_1.id}"
      expect(page).to_not have_content(@passenger_4.name)
    end
  end
end
