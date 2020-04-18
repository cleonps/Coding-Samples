//
//  CovidDetailViewController.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 12/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import UIKit
import Alamofire

class CovidDetailViewController: UIViewController {
    public var countryData: CountryData?
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var countryImageView: UIImageView!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var totalCases: UILabel!
    @IBOutlet var activeCases: UILabel!
    @IBOutlet var todayCases: UILabel!
    @IBOutlet var totalDeaths: UILabel!
    @IBOutlet var todayDeaths: UILabel!
    @IBOutlet var recovered: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentData()
        let behindPressGesture = UITapGestureRecognizer(target: self, action: #selector(self.recognizeTap))
        view.addGestureRecognizer(behindPressGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let data = countryData {
            downloadImage(string: data.countryInfo.flag)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
    
    @objc func recognizeTap(_ tapGesture: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
    
    private func presentData() {
        if let data = countryData {
            detailTitle.text = "\(data.country)"
            totalCases.text = "\(styledNumber(data.cases))"
            activeCases.text = "\(styledNumber(data.active))"
            todayCases.text = "\(styledNumber(data.todayCases))"
            totalDeaths.text = "\(styledNumber(data.deaths))"
            todayDeaths.text = "\(styledNumber(data.todayDeaths))"
            recovered.text = "\(styledNumber(data.recovered))"
        }
    }
    
    private func styledNumber(_ number: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        return formattedNumber!
    }
    
    private func downloadImage(string: String) {
        guard let url = URL(string: string) else { return }
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { res in
            let data = res.data
            self.bleh(data: data)
        }
    }
    
    private func bleh(data: Data?) {
        if let flag = data {
            countryImageView.image = try? UIImage(data: flag)
        }
    }
}
