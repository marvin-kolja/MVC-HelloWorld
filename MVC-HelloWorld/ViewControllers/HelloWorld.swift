//
//  HelloWorld.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

class HelloWorld: UIViewController {
    private let helloWorldLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupLabel()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let name = UserRepo.shared.name else {
            fatalError("Name is nil")
        }
        helloWorldLabel.text = "Hello \(name)!"
    }

    func setupLabel() {
        view.addSubview(helloWorldLabel)

        helloWorldLabel.textAlignment = .center
        helloWorldLabel.textColor = Colors.text
        helloWorldLabel.font = UIFont.systemFont(ofSize: 40)
        helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false

        _activateLayoutConstraints([
            helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            helloWorldLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            helloWorldLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
