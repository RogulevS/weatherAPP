//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Rogulev Sergey on 28.07.2023.
//

import UIKit

// MARK: - Enums

private enum Constants {
    static let textPadding = UIEdgeInsets(top: 0, left: 44, bottom: 0, right: 44)
    static let fontSize: CGFloat = 20
    static let cornerRadius: CGFloat = 16
    static let borderWidth: CGFloat = 1
    static let xmark = "xmark"
    static let nameColor = "infoColor"
    static let placeholder = "Введите город"
}

// MARK: - SearchTextField

final class SearchTextField: UITextField {
//
//    private let crossButton = CrossButton()
//    private let lensView = LensView()

    // MARK: - Initializer
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        //endEditing(<#Bool#>)
        setupTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Override Methods
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: Constants.textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: Constants.textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: Constants.textPadding)
    }
    
    // MARK: - Methods
    
    func startEditing() {
      //  crossButton.isHidden = false
        font = .systemFont(ofSize: Constants.fontSize, weight: .bold)
        placeholder = .none
    }

    func endEditing() {
      //  crossButton.isHidden = true
        font = .systemFont(ofSize: Constants.fontSize)
        placeholder = Constants.placeholder
        resignFirstResponder()
    }
    
    func clear() {
        text = ""
    }
    
    // MARK: - Private Methods
    
    private func setupTextField(placeholder: String) {
        backgroundColor = .clear
        layer.cornerRadius = Constants.cornerRadius
        autocorrectionType = .no
        layer.borderWidth = Constants.borderWidth
    
      //  leftView = lensView
        leftViewMode = .always
      //  rightView = crossButton
        rightViewMode = .always
        
        guard let color = UIColor(named: Constants.nameColor) else { return }
        layer.borderColor = color.cgColor
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
        textColor = color
        
      //  crossButton.delegate = self
    }
}

//// MARK: - CrossButtonDelegate
//
//extension SearchTextField: CrossButtonDelegate {
//    func tapButton() {
//        text = ""
//    }
//}

