//
//  FirstScreenExtensions.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

extension FirstScreen: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}
