//
//  UIViewControllerExtensions.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

extension UIViewController {
    /**
        * A little helper function to not always write out `NSLayoutConstraint.activate`
     */
    internal func _activateLayoutConstraints(_ layoutConstraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        App.logger.debug("Close keyboard since user touched outside of the keyboard")
        dismissKeyboard()
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

