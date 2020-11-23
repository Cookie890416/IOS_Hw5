//
//  Country.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    var country: String
    var selectedRegion: String
    var score: Int
    
    var day: Int
    var favorite: Bool
}
