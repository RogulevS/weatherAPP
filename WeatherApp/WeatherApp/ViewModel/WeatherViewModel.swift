import Combine
import Foundation

final class WeatherViewModel {
    @Published var city: String = ""
    @Published var currentWeather = WeatherModel.placeholder
    private var cancellable: Set<AnyCancellable> = []

    init() {
        $city
            .debounce(for: 1, scheduler: RunLoop.main)
            .flatMap {
                (city:String) -> AnyPublisher <WeatherModel, Never> in WeatherService.shared.fetchWeather(for: city)
              }
            .assign(to: \.currentWeather , on: self)
            .store(in: &self.cancellable)
    }
}
