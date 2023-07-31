import UIKit
import Combine
import SnapKit

final class WeatherViewController: UIViewController {
    let viewModel = WeatherViewModel()
    var cancellable: Set<AnyCancellable> = []
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.MainStrings.mainLabel
        label.font = Resources.Fonts.titleFont
        label.textColor = .orange
        
        return label
    }()
    
    private var searchTextField: UISearchTextField = {
        let textField = UISearchTextField()
        textField.placeholder = Resources.Strings.MainStrings.placeholder
        
        return textField
    }()
    
    private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.temperatureLabel
        label.textColor = .orange
        
        return label
    }()
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: Resources.Images.backgroundImage)
        
        return imageView
    }()
    

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.text = viewModel.city
        setupBinding()
        addSubviews()
        setupConstraints()
    }
    
    //MARK: - methods
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(mainLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(searchTextField)
    }
    
    private func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Resources.Int.inset)
            make.top.equalToSuperview().inset(Resources.Int.inset)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Resources.Int.inset)
            make.top.equalTo(mainLabel).inset(Resources.Int.inset)
        }
    }
    
    private func setupBinding() {
        searchTextField.textPublisher
           .assign(to: \.city, on: viewModel)
           .store(in: &cancellable)

        viewModel.$currentWeather
           .sink(receiveValue: {[weak self] currentWeather in
               self?.temperatureLabel.text = currentWeather.main?.temp != nil ? "\(Int((currentWeather.main?.temp ?? 0))) \(Resources.Strings.MainStrings.c)" : ""})
           .store(in: &cancellable)
    }
}
//MARK: - extension

extension UISearchTextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
