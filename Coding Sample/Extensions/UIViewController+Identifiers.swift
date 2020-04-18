//
//  UIViewController+Identifiers.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 06/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit

extension UIViewController {
    public enum Segues: String {
        case location = "LocationSegue"
        case covid = "CovidSegue"
    }
    
    public enum Storyboards: String {
        case main = "Main"
        case location = "Location"
        case covid = "Covid"
    }
    
    public enum ViewIdentifiers: String {
        case location = "Location"
        case covid = "Covid"
        case covidDetail = "CovidDetail"
    }
    
    public func performSegue(withIdentifier identifier: Segues) {
        performSegue(withIdentifier: identifier.rawValue, sender: nil)
    }
    
    /// Returns an instance of UIViewController subclass
    ///
    /// - Parameters:
    ///     - storyboard: The *name* of the storyboard in which the view is located.
    ///     - identifier: The *storyboard id* property of the view.
    ///     - controller: The *UIViewController subclass* associated with the view.
    ///     - presentation: The *UIModalPresentationStyle*, default value is .fullScreen
    public func instantiateVC<T: UIViewController>(storyboard: Storyboards, identifier: ViewIdentifiers, controller: T.Type, presentation: UIModalPresentationStyle? = .fullScreen) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier.rawValue) as! T
        viewController.modalPresentationStyle = presentation!
        
        return viewController
    }
}
