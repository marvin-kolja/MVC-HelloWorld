//
//  Colors.swift
//  MVC-HelloWorld
//
//  Created by Marvin Willms on 25.02.23.
//

import UIKit

struct DarkColors {
    static let background = UIColor(red: 30 / 255, green: 30 / 255, blue: 30 / 255, alpha: 1)
    static let widget = UIColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
    static let text: UIColor = .white
    static let secondaryText = UIColor(red: 140 / 255, green: 140 / 255, blue: 140 / 255, alpha: 1)

    static let primary = UIColor(red: 44 / 255, green: 189 / 255, blue: 11 / 255, alpha: 1)
}

struct LightColors {
    static let background: UIColor = .white
    static let widget = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    static let text: UIColor = .black
    static let secondaryText = UIColor(red: 70 / 255, green: 70 / 255, blue: 70 / 255, alpha: 1)

    static let primary = UIColor(red: 44 / 255, green: 189 / 255, blue: 11 / 255, alpha: 1)
}

struct Colors {
    static let background = Configuration.darkMode ? DarkColors.background : LightColors.background
    static let widget = Configuration.darkMode ? DarkColors.widget : LightColors.widget
    static let text = Configuration.darkMode ? DarkColors.text : LightColors.text
    static let secondaryText = Configuration.darkMode ? DarkColors.secondaryText : LightColors.secondaryText

    static let primary = Configuration.darkMode ? DarkColors.primary : LightColors.primary
}
