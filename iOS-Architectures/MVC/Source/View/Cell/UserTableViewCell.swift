//
//  UserTableViewCell.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 26/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UserTableViewCell: CellConfigurable {

    typealias T = User

    func configure(with item: User) {
        self.nameLabel.text = item.name
        self.usernameLabel.text = item.username
        self.emailLabel.text = item.email
        self.phoneLabel.text = item.phone
    }
}

protocol CellConfigurable where Self: UITableViewCell {
    associatedtype T

    func configure(with item: T)
}
