//
//  UIImage+Names.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 08/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit

extension UIImage {
    public enum ImageName: String {
        case location = "Location"
        case covid = "Covid"
        case none = ""
    }
    
    convenience init?(named: ImageName) {
        self.init(named: named.rawValue)
    }
    
}
