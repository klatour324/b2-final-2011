require "rails_helper"

RSpec.describe Flight, type: :model do
  before :each do
    @flight_1 = Flight.create!(number: "1727", date: "11/23/20", departure_city: "Chicago", arrival_city: "Denver" )
    @flight_2 = Flight.create!(number: "1922", date: "11/25/20", departure_city: "New York", arrival_city: "Tampa" )
    @flight_3 = Flight.create!(number: "1888", date: "11/30/20", departure_city: "Dallas", arrival_city: "Seattle" )
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
end
