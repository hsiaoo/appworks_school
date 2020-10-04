//
//  ViewController.swift
//  Assignment4_json
//
//  Created by H.W. Hsiao on 2020/10/4.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stationidLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    struct Data: Decodable {
        var stationID: String
        var stationName: String
        var stationAddress: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get()
    }
    
    func get() {
        let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let loadedData = data {
                do {
                    let okData = try JSONDecoder().decode(Data.self, from: loadedData)
                    let id = okData.stationID
                    let name = okData.stationName
                    let address = okData.stationAddress
                    OperationQueue.main.addOperation {
                        self.stationidLabel.text = id
                        self.stationNameLabel.text = name
                        self.addressLabel.text = address
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
