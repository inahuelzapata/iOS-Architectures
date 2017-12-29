//
//  UserService-MVP.swift
//  iOS-Architectures
//
//  Created by Nicolas Alvarez on 28/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import UIKit
import BoltsSwift

class UserService_MVP: NSObject {
    func getUsers() -> Task<Any> {
        
        return UserRequestManager.getUsers()
            .continueOnSuccessWith { (response) -> Task<[User]> in
                
                if let users = response as? [User] {
                }
            
        }
            .continueOnErrorWith { (error) in
                
        }
    }
}
