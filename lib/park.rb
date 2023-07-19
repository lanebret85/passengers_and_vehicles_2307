class Park
  attr_reader :name, :admission_price, :vehicles, :passengers

  def initialize(park_details)
    @name = park_details[:name]
    @admission_price = park_details[:admission_price]
    @vehicles = []
    @passengers = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end
  
  def passengers
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |person|
        @passengers << person
      end
    end
    @passengers
  end

  def revenue
    total_revenue = 0
    passengers.map {
      |passenger| if passenger.adult?
      total_revenue += @admission_price
      end
    }
    total_revenue
  end
end