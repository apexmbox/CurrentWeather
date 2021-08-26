//
//  ViewController+SearchAlertController.swift
//  CurrentWeather
//
//  Created by Apex on 25.08.2021.
//

import UIKit

extension CurrentWeatherViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { (textField) in
            textField.placeholder = "Enter city"
        }
        
        let searchButton = UIAlertAction(title: "Search", style: UIAlertAction.Style.default) { (action) in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        ac.addAction(searchButton)
        ac.addAction(cancelButton)
        
        present(ac, animated: true, completion: nil)
    }
}
