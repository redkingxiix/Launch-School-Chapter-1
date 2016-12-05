class Vehicle
  def self.gas_mileage(gas, miles)
    x = gas/miles
    p "Your car's gas/mileage is #{x}"
    
  end

  def initialize(year, model)
    @year = year
    @model = model
    @speed = 0
  end
  
  def paint(color)
    if @speed > 0
      puts "Speed reduced to zero! can't paint cars that are moving"
    end
    @color = color
    @speed = 0
  end

  def speed_up
    @speed+=1
    p @speed.to_s
  end
  
  def slow_down
    unless speed == 0
      @speed-=1
    else
      p "Can't go slower than zero!"
    end
  end
end


class MyCar < Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, model, color)
    @color = color
  end
end

class MyVan < Vehicle
  attr_accessor :speed, :max_load
  attr_reader :year, :model

  def initialize(year, model,max_load)
    @max_load = max_load
  end
end


car = MyCar.new("red",1989, "Toyota")
puts car.color
puts car.year
puts car.model

car.paint("blue")
puts car.model
puts car.color
3.times do
  car.speed_up
end

4.times do
  car.slow_down
end

MyCar.gas_mileage(100,100)

van = MyVan.new(1989, 'honda', 10)
p van
