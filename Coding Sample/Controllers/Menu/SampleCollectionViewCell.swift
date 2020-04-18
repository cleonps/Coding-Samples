//
//  SamplesCollectionViewCell.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 06/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var containerView: UIView!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
    
}

