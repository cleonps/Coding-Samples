//
//  UICollectionView+Names.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 06/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit

extension UICollectionView {
    public enum CellNames: String {
        case sample = "Sample"
    }
    
    public enum NibNames: String {
        case sample = "SampleCollectionViewCell"
    }
    
    public func dequeReusableCell(withReuseIdentifier name: CellNames, for indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: name.rawValue, for: indexPath) as UICollectionViewCell
    }
    
    public func register(nibName: NibNames, cellName: CellNames) {
        self.register(UINib(nibName: nibName.rawValue, bundle: nil), forCellWithReuseIdentifier: cellName.rawValue)
    }
    
}
