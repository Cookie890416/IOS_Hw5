//
//  CountryEditor.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct CountryEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var countriesData: CountriesData
    @State private var country = ""
    @State private var selectedRegion = ""
    @State private var score  = 5
    @State private var day : CGFloat = 30
    
    @State private var favorite = true
    var disableForm: Bool {
        country.isEmpty || selectedRegion.isEmpty
    }
    var editCountry: Country?
    var region = ["台北市", "新北市", "桃園市","台中市","台南市", "高雄市"]
    var body: some View {
            Form {
                TextField("Name", text: $country)
                VStack{
                    Picker(selection: $selectedRegion, label: Text("縣市")) {
                        ForEach(self.region, id:\.self) { (city) in
                            Text(city)
                        }
                    }
                }
                Stepper("你給這道美食\(score)顆星", value: $score, in: 1...5)
                HStack {
                    Text("\(Int(day))天前去吃的")
                    Slider(value: $day, in: 1...100, step: 1)
                }
                Toggle("你喜歡這道食物嗎?", isOn:  $favorite)
            }
            .navigationBarTitle(editCountry == nil ? "Add new Food" : "Edit Food")
            .navigationBarItems(trailing: Button("save"){
                let country = Country(country: self.country, selectedRegion: self.selectedRegion, score: Int(self.score), day: Int(self.day), favorite: self.favorite)
                if let editCountry = self.editCountry{
                    let index = self.countriesData.countries.firstIndex{
                        $0.id == editCountry.id
                    }!      // 因為必有值，所以用驚嘆號
                    self.countriesData.countries[index] = country
                } else{
                    self.countriesData.countries.insert(country, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }.disabled(disableForm))
       
                .onAppear{
                    if let editCountry = self.editCountry, self.country == "" {
                        self.country = editCountry.country
                        self.selectedRegion = editCountry.selectedRegion
//                        self.day = editCountry.day
                        self.score = editCountry.score
                        self.favorite = editCountry.favorite
                    }
        }
    }
}

struct CountryEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryEditor(countriesData: CountriesData())
        }
    }
}
