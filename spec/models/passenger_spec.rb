require "rails_helper"

RSpec.describe Passenger, type: :model do
  before :each do
  @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver", time: "4:44PM" )
    @passenger_1 = @flight_1.passengers.create!(name: "Katy La Tour", age: 29)
    @passenger_2 = @flight_1.passengers.create!(name: "Juls Feliciano", age: 32)
    @passenger_3 = @flight_1.passengers.create!(name: "Joe Shmoe", age: 14)
    @passenger_4 = @flight_1.passengers.create!(name: "Karen Shmaren", age: 18)
  end
  describe "relationships" do
    it { should have_many :flight_passengers}
    it { should have_many(:flights).through(:flight_passengers)}
  end

  describe "class methods" do
    describe "::eighteen_and_older" do
      it "returns passengers who are the age of 18 years old or older" do
        expect(Passenger.eighteen_and_older).to eq([@passenger_1, @passenger_2, @passenger_4])
      end
    end
  end
end
