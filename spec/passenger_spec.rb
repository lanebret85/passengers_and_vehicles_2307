require "./lib/passenger"

RSpec.describe Passenger do
  describe "#exists" do
    it "exists" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie).to be_a(Passenger)
      expect(taylor).to be_a(Passenger)
    end
  end

  describe "#attributes" do
    it "has readable attributes" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
      expect(taylor.name).to eq("Taylor")
      expect(taylor.age).to eq(12)
    end
  end

  describe "#adult?" do
    it "can return true if a passenger is an adult" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end
  end

  describe "#driver?" do
    it "does not default to true" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.driver?).to eq(false)
      expect(taylor.driver?).to eq(false)
    end

    it "can make a passenger the driver with .drive method" do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      charlie.drive

      expect(charlie.driver?).to eq(true)
    end
  end
end
