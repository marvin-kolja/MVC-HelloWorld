//
//  FirstScreen.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

class FirstScreen: UIViewController {
    private let input = InputField()
    private let continueButton = Button()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupInput()
        setupContinueButton()
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.text]
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "MVC - Hello World"
    }

    func setupContinueButton() {
        view.addSubview(continueButton)

        continueButton.isHidden = true

        continueButton.configuration?.title = "Continue"

        continueButton.addTarget(self, action: #selector(goToHelloWorldScreen), for: .touchUpInside)

        _activateLayoutConstraints([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupInput() {
        view.addSubview(input)
        input.delegate = self

        input.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        _activateLayoutConstraints([
            input.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            input.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            input.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            input.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func goToHelloWorldScreen() {
        let nextScreen = HelloWorld()
        navigationController?.pushViewController(nextScreen, animated: true)
    }

    @objc func textFieldDidChange(_ textField: InputField) {
        if UserRepo.shared.name != nil {
            UserRepo.shared.name = textField.text
        } else {
            UserRepo.shared.name = textField.text
        }

        if textField.validate() != nil {
            continueButton.show()
        } else {
            continueButton.hide()
        }
    }
}


