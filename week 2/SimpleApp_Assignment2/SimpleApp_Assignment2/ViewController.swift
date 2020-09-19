//
//  ViewController.swift
//  SimpleApp_Assignment2
//
//  Created by H.W. Hsiao on 2020/9/19.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var funFactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func funFactButton(_ sender: Any) {
        change()
    }
    

    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cites of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."
    ]
    
    let color = [UIColor.red, UIColor.orange, UIColor.darkGray, UIColor.magenta, UIColor.blue, UIColor.lightGray, UIColor.purple]
    
    func change() {
        let number = Int.random(in: 0...6)
        funFactLabel.text = text[number]
        view.backgroundColor = color[number]
    }
    
    
}

