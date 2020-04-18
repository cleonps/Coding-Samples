//
//  CountryData.swift
//  Coding Sample
//
//  Created by Christian León Pérez Serapio on 08/04/20.
//  Copyright © 2020 christianleon. All rights reserved.
//

import Foundation

struct CountryData: Codable {
    var country: String
    var countryInfo: CountryInfo
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var active: Int
    var critical: Int
    
    struct CountryInfo: Codable {
        var lat: Float
        var long: Float
        var flag: String
    }
}
