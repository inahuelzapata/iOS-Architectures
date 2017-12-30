//
//  UserDetailViewController.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 26/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import UIKit

class MVCUserDetailViewController: UIViewController {
    let kSegueIdentifier = "showMapViewController"

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!

    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!

    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var catchPhraseLabel: UILabel!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadUserInfo()
    }

    @IBAction func showMapView(_ sender: Any) {
        self.performSegue(withIdentifier: kSegueIdentifier, sender: self)
    }

    func loadUserInfo() {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        phoneLabel.text = user.phone
        emailLabel.text = user.email
        websiteLabel.text = user.website

        streetLabel.text = user.address.street
        cityLabel.text = user.address.city

        companyNameLabel.text = user.company.name
        catchPhraseLabel.text = user.company.catchPhrase
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mapController = segue.destination as? MVCMapViewController {
            mapController.geoposition = self.user.address.geo
        }
    }
}
