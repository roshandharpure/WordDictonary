//
//  AlertView.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation

import UIKit

final class AlertView {
    
    func showAlert(with title: String = "Error", message: String, vc: UIViewController) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: .cancel))
        vc.present(alert, animated: true)
    }
    
}
