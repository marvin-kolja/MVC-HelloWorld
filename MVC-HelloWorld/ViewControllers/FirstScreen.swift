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
    private var userRepo: UserRepo

    init(userRepo: UserRepo) {
        self.userRepo = userRepo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        App.logger.debug("Going to next screen \("HelloWorld")")
        let nextScreen = App.container.resolve(HelloWorld.self)!
        navigationController?.pushViewController(nextScreen, animated: true)
    }

    @objc func textFieldDidChange(_ textField: InputField) {
        App.logger.debug("Name input changed to \(textField.text ?? "nil")")

        App.logger.debug("Saving name to UserRepo")
        userRepo.name = textField.text

        if textField.validate() != nil {
            App.logger.debug("Name input is valid, showing continue button")
            continueButton.show()
        } else {
            App.logger.debug("Name input is invalid, hiding continue button")
            continueButton.hide()
        }
    }
}


