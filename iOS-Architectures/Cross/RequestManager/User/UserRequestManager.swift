//
//  UserRequestManager.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import BoltsSwift

class UserRequestManager {

    private typealias Dictionary = [String: Any]

    class func getUsers() -> Task<Any> {
        let endpoint = "/users"

        let task = RequestManager.shared.get(endpoint: endpoint, params: [:], headers: [:])
            .continueOnSuccessWithTask(continuation: { (response) -> Task<Any> in
                guard let data = response as? Dictionary else {
                    fatalError("UserRequestManager error: response cannot be parsed as Dictionary")
                }
                guard let jsonData = data["result"] as? [Dictionary] else {
                    fatalError("UserRequestManager error: result field is not available on Dictionary")
                }

                let users = try JSONDecoder().decode([User].self, from: jsonData.jsonData())

                let taskToReturn = TaskCompletionSource<Any>()

                taskToReturn.set(result: users)

                return taskToReturn.task
            })

        return task
    }
}

extension JSONEncoder {
    func encodeJSONObject<T: Encodable>(_ value: T, options opt: JSONSerialization.ReadingOptions = []) throws -> Any {
        let data = try encode(value)
        return try JSONSerialization.jsonObject(with: data, options: opt)
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type,
                              withJSONObject object: Any,
                              options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
}
