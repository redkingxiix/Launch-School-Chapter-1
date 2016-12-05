class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model
  
  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @speed = 0
  end
  
  def shop!(color, year, model)
    if self.speed > 0
      puts "Speed reduced to zero!"
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

car.shop!("blue","1989","Aston Martin")
puts car.model
puts car.color
3.times do
  car.speed_up
end

4.times do
  car.slow_down
end
