//
//  BaseError.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import Marshal

class BaseError: Error {
    var errorCode: String = "unknown_error"
    var statusCode: Int = 0
    var description: String = "Error inesperado"
    var errorType = ""

    init(error: [String: Any]) {
        do {
            statusCode = try error.value(for: "statusCode")
            errorCode = try error.value(for: "result.error")
            description = try error.value(for: "result.error_description")
        } catch {
            print("BaseError: " + error.localizedDescription)
        }
    }

    init() {

    }
}
