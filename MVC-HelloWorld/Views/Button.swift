//
//  Button.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

class Button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }


    private func setUpButton() {
        self.configuration = .filled()
        self.configuration?.baseBackgroundColor = Colors.primary

        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func hide() {
        self.isHidden = true
    }

    func show() {
        self.isHidden = false
    }
}
