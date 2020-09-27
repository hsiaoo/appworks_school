//
//  SectionHeader.swift
//  CollectionView
//
//  Created by H.W. Hsiao on 2020/9/23.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    @IBOutlet private weak var flagImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    var section: Section! {
        didSet {
            flagImage.image = UIImage(named: section.title ?? "")
            titleLabel.text = section.title
            countLabel.text = "\(section.count)"
        }
    }
    
//    var title: String? {
//        didSet {
//            titleLabel.text = title
//        }
//    }
        
}
