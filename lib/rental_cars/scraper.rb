class Scraper
    def self.scrape(url)
        doc = Nokogiri::HTML(open(url))
        doc.css("div.car-result.group").each do |car|
            carType =  car.css("strong")[0].text
            carSize = car.css("p.car-class").text.split(" ")[0]
            carFinalPrice = car.css("p.result_now_pl").text.strip
            carCompany = car.css("div.supplier_id").css("img")[0].attr("alt")
            carFinalPrice = car.css("p.finalPrice").text.strip if carFinalPrice == ""
           
            carBags = car.css("span.result_luggage").text
            carPickup = car.css("div.result_pickup").text.strip
            carPolicy = car.css("div.free.group").css("strong").text

            newCar = RentalCars::Cars.new(carType,carSize,carFinalPrice, carCompany,carBags, carPickup, carPolicy)
        end
    end
    
end