//
//  InputField.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

class InputField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTextField()
    }


    private func setUpTextField() {
        // Base Color
        self.backgroundColor = Colors.widget
        self.textColor = Colors.text

        // Placeholder
        self.attributedPlaceholder = NSAttributedString(
                string: "What is your name?",
                attributes: [NSAttributedString.Key.foregroundColor: Colors.secondaryText]
        )

        // Border
        self.layer.borderColor = Colors.secondaryText.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5

        self.keyboardType = .default
        self.textAlignment = .center

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    /**
        * Does a simple validation on the text input.
        - Returns: The text if it is not empty, nil otherwise
        - Note: One can just extend this or change it completely to have different validation
     */
    func validate() -> String? {
        if let t = self.text, !t.isEmpty {
            return t
        } else {
            return nil
        }
    }
}
