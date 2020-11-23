//
//  CountryList.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct CountryList: View {
    @ObservedObject var countriesData = CountriesData()
    @State private var show = false
    var body: some View {
        NavigationView {
            List {
                ForEach(countriesData.countries){ (country) in
                    NavigationLink(destination: CountryEditor(countriesData:  self.countriesData, editCountry: country)) {
                        CountryRow(country1: country)
                    }
                }
                .onMove { (indexSet, index) in
                    self.countriesData.countries.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete{ (index) in
                    self.countriesData.countries.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("Food List")
            .navigationBarItems(leading: EditButton().accentColor(.green), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "plus.circle.fill")
                        .accentColor(.blue)
                    }))
                .sheet(isPresented: $show){
                    NavigationView {
                        CountryEditor(countriesData: self.countriesData) // 新增時不用修改
                    }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
