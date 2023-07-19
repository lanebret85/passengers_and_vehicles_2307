require "./lib/vehicle"
require "./lib/passenger"

RSpec.describe Vehicle do
  describe "#exists" do
    it "exists" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle).to be_a(Vehicle)
    end
  end

  describe "#attributes" do
    it "has readable attributes" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.year).to eq("2001")
      expect(vehicle.make).to eq("Honda")
      expect(vehicle.model).to eq("Civic")
    end
  end

  describe "#speeding?" do
    it "does not default to true" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.speeding?).to eq(false)
    end

    it "can return true for a vehicle speeding with .speed method" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      vehicle.speed

      expect(vehicle.speeding?).to eq(true)
    end
  end

  describe "#passengers and #add_passenger" do
    it "returns an empty array by default" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      expect(vehicle.passengers).to eq([])
    end

    it "can add passengers to the vehicle and return them in a list" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
      
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)  
      vehicle.add_passenger(taylor)

      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end

  describe "#num_adults" do
    it "can count and return the number of adults in a vehicle" do
      vehicle = Vehicle.new("2001", "Honda", "Civic")

      charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
      jude = Passenger.new({"name" => "Jude", "age" => 20})    
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
      
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)  
      vehicle.add_passenger(taylor)

      expect(vehicle.num_adults).to eq(2)
    end
  end
end
