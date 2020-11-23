//
//  CountryRow.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct CountryRow: View {
    var country1: Country
    var body: some View {
        HStack {
            
            Image("\(country1.selectedRegion)")
                .resizable()
                .scaledToFit()
                .frame(width:20)
            VStack(alignment: .leading){
                Text(country1.country)
                    .font(Font.system(size: 22))
                    .padding(.leading, 10)
                Text(country1.selectedRegion)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Text("\(country1.day)天前去吃的")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
//            Text("\(country1.country) / \(country1.selectedRegion)")
            Spacer()
            
            
             
            //
            ForEach(0..<country1.score)
            { (index) in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20, height:20)
                    .foregroundColor(Color.yellow)
            }
//            Text("\(country1.score) score")
            Image(systemName: country1.favorite ? "hand.thumbsup.fill": "hand.thumbsdown.fill")
            //
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country1: Country(country: "101", selectedRegion: "台北市", score: 100, day: 30,favorite: true)).previewLayout(.sizeThatFits)
    }
}
