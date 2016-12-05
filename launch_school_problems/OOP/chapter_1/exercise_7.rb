class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model
 
  def self.gas_mileage(gas, miles)
    x = gas/miles
    p "Your car's gas/mileage is #{x}"
    
  end

  def to_s
    p "My name is Buck. And I like to... fix cars!"
    p "Your model is #{self.model}, the color is #{self.color} and it was made in #{self.year}"
  end

  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @speed = 0
  end
  
  def paint(color)
    if self.speed > 0
      puts "Speed reduced to zero! can't paint cars that are moving"
    end
    self.color = color
    self.speed = 0
  end

  def speed_up
    self.speed+=1
    p self.speed
  end
  
  def slow_down
    unless speed == 0
      self.speed-=1
    else
      p "Can't go slower than zero!"
    end
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
car.to_s
