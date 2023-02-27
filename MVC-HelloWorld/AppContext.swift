//
// AppContext.swift
// MVC-HelloWorld
//
// Created by Marvin Willms on 27.02.23.
//

import Foundation
import Swinject
import Logging

class App {
    static let darkMode = false;

    static let container: Container = {
        let container = Container()
        container.register(UserRepo.self) { _ in
            UserRepo.shared
        }
        container.register(FirstScreen.self) { r in
            FirstScreen(userRepo: r.resolve(UserRepo.self)!)
        }
        container.register(HelloWorld.self) { r in
            HelloWorld(userRepo: r.resolve(UserRepo.self)!)
        }
        container.register(Logger.self) { _ in
            CustomLogger.shared.logger
        }
        return container
    }()

    static let logger = container.resolve(Logger.self)!
}
