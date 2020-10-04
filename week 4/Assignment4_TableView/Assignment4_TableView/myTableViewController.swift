//
//  myTableViewController.swift
//  Assignment4_TableView
//
//  Created by H.W. Hsiao on 2020/10/4.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        cell.textLabel?.text = "This is section \(indexPath.section), row \(indexPath.row)"
        return cell
    }
    

}
