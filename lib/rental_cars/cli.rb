# our Cli controller

class RentalCars::Cli
    
    def call
        puts " Welcome to rental cars, This will help in renting Cars from Cincinnati"
        menu
        puts "Goodbye"
    end

    def menu
        puts "Please put the pickup date MM/DD/YYYY or exit"
        input = nil 
        
        if input != "exit"
            input = gets.strip.downcase
            pickupMonth = input.split("/")[0]
            pickupDay = input.split("/")[1]
            pickupYear = input.split("/")[2]
            if input != "exit"
                puts "Please put the return date MM/DD/YYYY"
                input = gets.strip.downcase
                if input != "exit"
                    returnMonth = input.split("/")[0]
                    returnDay= input.split("/")[1]
                    returnYear = input.split("/")[2]

                    generateURL(pickupMonth,pickupDay,pickupYear,returnMonth,returnDay,returnYear)
                end
            end
        end
    end
        def generateURL(pickupMonth,pickupDay,pickupYear,returnMonth,returnDay,returnYear)
            url = "https://www.rentalcars.com/SearchResults.do?doYear=#{returnYear}&puLocationType=location&serverName=&rateQualifier.frequentTravelerIDNumber=&fromFts=true&doCountryCode=us&driversAge=30&filterTo=20&countryCode=us&doMinute=0&rateQualifier.discountNbr=&puYear=#{pickupYear}&puSearchAgainInput=Cincinnati%2c+OH&puMinute=0&searchType=geosearch&doDay=#{returnDay}&filterFrom=0&coordinates=39.14799880981445%2c-84.47699737548828&puMonth=#{pickupMonth}&rateQualifier.rateCode=&carCategory=&doHour=10&puSearchInput=Cincinnati%2c+OH&rateQualifier.accountNo=&puDay=#{pickupDay}&newSearchResults=true&puHour=10&preferred_company=&rateQualifier.partnerCode=&doMonth=#{returnMonth}&filterName=CarCategorisationSupplierFilter"
            Scraper.scrape(url)
            printCars
        end


        def printCars
            
                    i = 0
                    RentalCars::Cars.all.each do|eachCar|
                        puts "#{i+=1}. #{eachCar.carType} - #{eachCar.carSize} - #{eachCar.carFinalPrice} - #{eachCar.carCompany}"
                    end
                    puts "Please select Car to see more details or exit"
                    input = gets.strip.downcase

                    if input != "exit"
                        
                        carDetails(input)
                    end
        end

        def carDetails(input)

            if input != "exit"
                if input =~ /\A[-+]?[0-9]+\z/ 
                    puts  "Car Type: #{RentalCars::Cars.all[input.to_i-1].carType}."
                    puts  "Size: #{RentalCars::Cars.all[input.to_i-1].carSize}."
                    puts  "Final Price: #{RentalCars::Cars.all[input.to_i-1].carFinalPrice}."
                    puts  "Company: #{RentalCars::Cars.all[input.to_i-1].carCompany}."
                    puts  "No of bags: #{RentalCars::Cars.all[input.to_i-1].carBags}."
                    puts  "Pick-up location: #{RentalCars::Cars.all[input.to_i-1].carPickup}."
                    puts  "Policy: #{RentalCars::Cars.all[input.to_i-1].carPolicy}."

                    puts "Please select Car to see more details or exit"
                   input = gets.strip.downcase
                    carDetails(input)                    
                end
            end
        end
end