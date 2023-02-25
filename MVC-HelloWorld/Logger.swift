//
// Logger.swift
// MVC-HelloWorld
//
// Created by Marvin Willms on 25.02.23.
//

import Foundation
import Logging

final class CustomLogger {
    static let shared: CustomLogger = CustomLogger()

    let logger: Logger = {
        LoggingSystem.bootstrap { label in
            var handler = StreamLogHandler.standardOutput(label: label)

            #if DEBUG
            handler.logLevel = .trace
            #else
            handler.logLevel = .info
            #endif

            return handler
        }

        return Logger(label: Bundle.main.bundleIdentifier!)
    }()
}
