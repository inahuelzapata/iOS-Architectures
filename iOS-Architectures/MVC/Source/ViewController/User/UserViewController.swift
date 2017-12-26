//
//  UserViewController.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 25/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getUser()
    }

    func getUser() {
        UserRequestManager.getUsers()
            .continueOnSuccessWith { (response) -> Void in
                print(response)
        }
    }
}
