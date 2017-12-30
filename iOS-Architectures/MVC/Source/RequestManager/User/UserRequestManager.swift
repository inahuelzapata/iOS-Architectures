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
