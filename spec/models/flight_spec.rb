require "rails_helper"

RSpec.describe Flight, type: :model do
  before :each do
    @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver" )
    @flight_2 = Flight.create!(number: "1922", date: "11/25/20", departure_city: "New York", arrival_city: "Tampa" )
    @flight_3 = Flight.create!(number: "1888", date: "11/30/20", departure_city: "Dallas", arrival_city: "Seattle" )
    @passenger_1 = @flight_1.passengers.create!(name: "Katy La Tour", age: 29)
    @passenger_2 = @flight_1.passengers.create!(name: "Juls Feliciano", age: 32)
    @passenger_3 = @flight_1.passengers.create!(name: "Joe Shmoe", age: 14)
    @passenger_4 = @flight_1.passengers.create!(name: "Karen Shmaren", age: 18)
  end
  describe "relationships" do
    it { should have_many :flight_passengers}
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe "class methods" do
    describe "::order_by_departure" do
      it "returns the flights ordered alphabetically by their departure city" do
        expect(Flight.order_by_departure).to eq([@flight_1, @flight_3, @flight_2])
      end
    end
  end

  describe "instance methods" do
    describe "#eighteen_and_older" do
      it "returns passengers who are the age of 18 years old or older" do
        expect(@flight_1.eighteen_and_older).to eq([@passenger_1, @passenger_2, @passenger_4])
      end
    end

    describe "#average_age_of_adult_passengers" do
      it "can find average age for adult passengers" do
        expect(@flight_1.average_age_of_adult_passengers).to eq(26.33)
      end
    end
  end
end
