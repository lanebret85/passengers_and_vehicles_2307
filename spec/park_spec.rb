require "./lib/park"
require "./lib/vehicle"
require "./lib/passenger"

RSpec.describe Park do
  describe "#exists" do
    it "exists" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      expect(chatfield).to be_a(Park)
    end
  end

  describe "#attributes" do
    it "has readable attributes" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      expect(chatfield.name).to eq("Chatfield")
      expect(chatfield.admission_price).to eq(15)
    end
  end

  describe "#vehicles and #add_vehicle" do
    it "starts with an empty array" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      expect(chatfield.vehicles).to eq([])
    end

    it "can add vehicles to a list of vehicles that enter the park and return it" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2019", "Toyota", "4Runner")
      vehicle_3 = Vehicle.new("2018", "Subaru", "Outback")

      chatfield.add_vehicle(vehicle_1)
      chatfield.add_vehicle(vehicle_2)
      chatfield.add_vehicle(vehicle_3)

      expect(chatfield.vehicles).to eq([vehicle_1, vehicle_2, vehicle_3])
    end
  end

  describe "#passengers" do
    it "starts with an empty array" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      expect(chatfield.passengers).to eq([])
    end

    it "can return a list of passengers from all vehicles" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2019", "Toyota", "4Runner")
      vehicle_3 = Vehicle.new("2018", "Subaru", "Outback")

      chatfield.add_vehicle(vehicle_1)
      chatfield.add_vehicle(vehicle_2)
      chatfield.add_vehicle(vehicle_3)

      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 12})
      taylor = Passenger.new({"name" => "Taylor", "age" => 27})
      lane = Passenger.new({"name" => "Lane", "age" => 27})
      
      vehicle_1.add_passenger(charlie)
      vehicle_1.add_passenger(jude)
      vehicle_2.add_passenger(taylor)
      vehicle_3.add_passenger(lane)
      
      expect(chatfield.passengers).to eq([charlie, jude, taylor, lane])
    end
  end

  describe "#revenue" do
    it "can calculate total revenue generated from all adults entering the park" do
      chatfield = Park.new({name: "Chatfield", admission_price: 15})

      vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
      vehicle_2 = Vehicle.new("2019", "Toyota", "4Runner")
      vehicle_3 = Vehicle.new("2018", "Subaru", "Outback")

      chatfield.add_vehicle(vehicle_1)
      chatfield.add_vehicle(vehicle_2)
      chatfield.add_vehicle(vehicle_3)

      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      jude = Passenger.new({"name" => "Jude", "age" => 12})
      taylor = Passenger.new({"name" => "Taylor", "age" => 27})
      lane = Passenger.new({"name" => "Lane", "age" => 27})
      
      vehicle_1.add_passenger(charlie)
      vehicle_1.add_passenger(jude)
      vehicle_2.add_passenger(taylor)
      vehicle_3.add_passenger(lane)

      expect(chatfield.revenue).to eq(45)
    end
  end
end