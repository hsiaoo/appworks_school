//
//  DetailViewController.swift
//  CollectionView
//
//  Created by H.W. Hsiao on 2020/9/22.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selection: String!
    
    @IBOutlet private weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsLabel.text = selection
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
