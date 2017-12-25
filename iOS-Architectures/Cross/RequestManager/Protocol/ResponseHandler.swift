//
//  ResponseHandler.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import BoltsSwift
import Alamofire

protocol ResponseHandler {
    associatedtype TaskSource

    associatedtype Response

    func handle(_ task: TaskSource, with response: Response)
}

extension ResponseHandler {
    typealias TaskSource = TaskCompletionSource<Any>
    typealias Response = DataResponse<Any>

    func handle(_ task: TaskCompletionSource<Any>, with response: DataResponse<Any>) {
        do {
            switch response.result {
            case .success:
                task.set(result: ["statusCode": response.response?.statusCode, "result": response.result.value])
                break
            case .failure:
                let errorData = try JSONSerialization.jsonObject(with: response.data!)

                guard let error = errorData as? [String: Any] else {
                    fatalError("Cannot cast error to [String: Any]")
                }

                guard let errorDescription = error["description"] else {
                    fatalError("Error description is optional or nil")
                }

                guard let errorCode = error["code"] else {
                    fatalError("Error getting error code")
                }
                task.set(error: HttpRequestError(requestError: ["statusCode": response.response?.statusCode ?? 600,
                    "error": errorCode,
                    "description": errorDescription]))
            }
        } catch {
            task.set(error: BaseError(error: ["statusCode": 600,
                "error": "json_parsing",
                "description": "JSON parsing error"]))
        }
    }
}
