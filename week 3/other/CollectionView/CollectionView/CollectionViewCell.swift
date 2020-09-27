//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by H.W. Hsiao on 2020/9/22.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    
    var isEditing: Bool = false {
        didSet {
            selectionImage.isHidden = !isEditing
        }
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
    
}
