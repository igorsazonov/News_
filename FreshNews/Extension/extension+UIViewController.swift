//
//  extension+UIViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 05.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func callingTheAlertViewController (transmitMessages message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
