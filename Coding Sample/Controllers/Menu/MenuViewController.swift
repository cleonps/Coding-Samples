//
//  MenuViewController.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 06/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    let samples = [
        Sample(name: "Geolocalización", imageName: .location, segue: .location),
        Sample(name: "Covid19 Map", imageName: .covid, segue: .covid),
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        
        Sample(name: "Placeholder", imageName: .none, segue: .location),
        Sample(name: "Placeholder", imageName: .none, segue: .location)
    ]
    
    @IBOutlet var sampleCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleCollectionView.register(nibName: .sample, cellName: .sample)
    }
    
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return samples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReusableCell(withReuseIdentifier: .sample, for: indexPath) as! SampleCollectionViewCell
        let sample = samples[indexPath.row]
        
        cell.titleLabel.text = sample.name
        
        if sample.imageName != .none {
            cell.iconImage.image = UIImage(named: sample.imageName)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: samples[indexPath.row].segue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideSize = view.frame.width / 4
        return CGSize(width: sideSize, height: sideSize)
    }
}
