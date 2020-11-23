//
//  ContentView.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryData = CountriesData()
    var body: some View {
        VStack{
            TabView {
                CountryList(countriesData: self.countryData)
                    .tabItem {
                        Text("List")
                        Image(systemName: "house.fill")
                }
                ChartView(countryData: self.countryData)
                    .tabItem{
                    Image(systemName: "chart.pie.fill")
                    Text("Chart")
                }
            }
            .accentColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
