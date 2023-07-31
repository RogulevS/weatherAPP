import Foundation
import Combine
import UIKit

final class WeatherService {
    static let shared = WeatherService()
    
    private let url = Resources.Strings.MainStrings.url

    private func buildRequest(city: String) -> URL? {
        let url = URL(string: url)!
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else { return nil }
        let keyQueryItem = Resources.Strings.QueryItemStrings.keyQueryItem
        let unitsQueryItem = Resources.Strings.QueryItemStrings.unitsQueryItem
        let qQueryItem = URLQueryItem(name: Resources.Strings.QueryItemStrings.qQueryItem, value: city)
        urlComponents.queryItems = [keyQueryItem, unitsQueryItem, qQueryItem]
        
        return urlComponents.url
    }
    
    func fetchWeather(for city: String) -> AnyPublisher<WeatherModel, Never> {
        guard let url = buildRequest(city: city) else { return Just(WeatherModel.placeholder).eraseToAnyPublisher() }
        print(url)
        return URLSession.shared.dataTaskPublisher(for:url)
            .map { $0.data }
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .catch { error in Just(WeatherModel.placeholder)}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
