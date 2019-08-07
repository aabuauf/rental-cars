class RentalCars::Cars
    attr_accessor :carType, :carSize, :carFinalPrice, :carCompany, :carBags, :carPickup, :carPolicy
        @@all = []
    def initialize (carType,carSize,carFinalPrice, carCompany, carBags, carPickup, carPolicy)
        @carType = carType
        @carSize = carSize
        @carFinalPrice = carFinalPrice
        @carCompany = carCompany
        @carBags = carBags
        @carPickup = carPickup
        @carPolicy = carPolicy
        @@all << self
    end
    def self.all
        @@all
    end
    def printCars
        i = 0
        @@all.each do|eachCar|
            puts "#{i+=1}. #{@carType} - #{@carSize} - #{@carFinalPrice}"
        end
    end
end