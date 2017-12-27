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
    var users: [User] = []
    let kCellIdentifier = "UserTableViewCellIdentifier"

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureComponents()
        getUser()
    }

    func getUser() {
        UserRequestManager.getUsers()
            .continueOnSuccessWith { (response) -> Void in
                if let users = response as? [User] {
                    self.users = users
                }

                self.tableView.reloadData()
        }
    }

    func configureComponents() {
        tableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil),
                           forCellReuseIdentifier: kCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 2.0
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) as? UserTableViewCell else {
            fatalError("Cannot dequeue cell with identifier: \(kCellIdentifier)")
        }

        cell.configure(with: users[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}
