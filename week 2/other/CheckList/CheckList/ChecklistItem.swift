//
//  ChecklistItem.swift
//  CheckList
//
//  Created by H.W. Hsiao on 2020/9/16.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
}

