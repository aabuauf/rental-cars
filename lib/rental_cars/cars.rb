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
  #  def self.scrape_cars(url = "https://www.rentalcars.com/SearchResults.do?doYear=2019&puLocationType=location&serverName=&rateQualifier.frequentTravelerIDNumber=&fromFts=true&doCountryCode=us&driversAge=30&filterTo=20&countryCode=us&doMinute=0&rateQualifier.discountNbr=&puYear=2019&puSearchAgainInput=Cincinnati%2c+OH&puMinute=0&searchType=geosearch&doDay=9&filterFrom=0&coordinates=39.14799880981445%2c-84.47699737548828&puMonth=8&rateQualifier.rateCode=&carCategory=&doHour=10&puSearchInput=Cincinnati%2c+OH&rateQualifier.accountNo=&puDay=6&newSearchResults=true&puHour=10&preferred_company=&rateQualifier.partnerCode=&doMonth=8&filterName=CarCategorisationSupplierFilter")
  #      doc = Nokogiri::HTML(open(url))
  #      i = 0
  #      doc.css("div.car-result.group").each do |car|
  #          @carType =  car.css("strong")[0].text
   #         @carSize = car.css("p.car-class").text.split(" ")[0]
   #         @carFinalPrice = car.css("p.result_now_pl").text.strip
   #         newCar = RentalCars::Cars.new()
   #         newCar.carType = @carType
   #         newCar.carSize = @carSize
   #         newCar.carFinalPrice = @carFinalPrice
   #         @@all << newCar   
        
   #         puts "#{i+=1}. #{@carType} - #{@carSize} - #{@carFinalPrice}"
   #        binding.pry
   #     end
   # end
end