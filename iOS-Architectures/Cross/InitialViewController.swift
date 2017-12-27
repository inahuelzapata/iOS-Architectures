//
//  InitialViewController.swift
//  iOS-Architectures
//
//  Created by Nahuel Zapata on 26/12/2017.
//  Copyright © 2017 Nahuel Zapata. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: UIViewController {
    let mvcArchitectureIdentifier = "goToUserStoryboard"

    @IBAction func showMVCArch(_ sender: Any) {
        self.performSegue(withIdentifier: mvcArchitectureIdentifier, sender: self)
    }
}
