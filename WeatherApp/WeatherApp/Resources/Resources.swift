import Foundation
import UIKit

enum Resources {
    
    enum Images {
        static var backgroundImage = UIImage(named: "background")
    }
    
    enum Fonts {
        static var titleFont = UIFont.boldSystemFont(ofSize: 30)
        static var temperatureLabel = UIFont.boldSystemFont(ofSize: 100)
    }
    
    enum Int {
        static var inset = 50
    }
    
    enum Strings {
        enum QueryItemStrings {
            static var keyQueryItem = URLQueryItem(name: "appid", value: "f723044dbd95d94272e509a6b805321e")
            static var unitsQueryItem = URLQueryItem(name: "units", value: "metric")
            static var qQueryItem = "q"
        }
        enum MainStrings{
            static var mainLabel = "ПОГОДА СЕГОДНЯ"
            static var placeholder = "Введите название города"
            static var url = "https://api.openweathermap.org/data/2.5/weather"
            static var apiKey = "f723044dbd95d94272e509a6b805321e"
            static var c = "ºC"
        }
    }
    
  
    
}

