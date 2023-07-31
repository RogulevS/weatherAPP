import Foundation

struct WeatherModel: Codable {

    let main: Main?

    static var placeholder: Self {
        return WeatherModel(main: nil)
    }
}

struct Main: Codable {
    let temp: Double
    
}
