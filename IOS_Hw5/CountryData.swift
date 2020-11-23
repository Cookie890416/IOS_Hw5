//
//  CountryData.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import Foundation
import Combine

class CountriesData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var countries = [Country]()
    
    init(){
        // 解碼，讀檔
        if let data = UserDefaults.standard.data(forKey: "countries"){
          let decoder = JSONDecoder()
          if let decodedData = try? decoder.decode([Country].self, from: data){
            countries = decodedData
          }
        }
        // 編碼，存檔
        cancellable = $countries
            .sink(receiveValue: { (value) in
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(value) {
              UserDefaults.standard.set(data, forKey: "countries")
             }
            })
    }
}

