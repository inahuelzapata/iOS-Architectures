//
//  HttpRequestError.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation

class HttpRequestError: BaseError {
    override init(error: [String: Any]) {
        super.init(error: error)
    }

    init (requestError: [String: Any]) {
        super.init()
        do {
            statusCode = try requestError.value(for: "statusCode") ?? 0
            errorCode = try requestError.value(for: "error") ?? "unknown_error"
            description = try requestError.value(for: "description") ?? "Error inesperado"
            errorType = RequestErrorType.requestError
        } catch {
            NSLog("HttpRequestError: " + error.localizedDescription)
        }
    }
}

struct RequestErrorType {
    static let requestError = "Alamofire Error"
    static let unknownError = "Unknown Error"
}
