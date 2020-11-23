//
//  ChartView.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct ChartView: View {
    @ObservedObject var countryData = CountriesData()
    @State private var selectedChart = "圓餅圖"
    var chart = ["圓餅圖", "柱狀圖"] // donut chart
    var region = ["台北市", "新北市", "桃園市","台中市","台南市", "高雄市"]
    var percentFood: [Double] = [0, 0, 0, 0, 0, 0]
    var totalFood: Double = 0
    var countryCount: [Double] = [0,0,0,0,0,0]
    var rate: Double = 0
    init (countryData: CountriesData){
        for country in countryData.countries{
            for i in 0..<6{
                if country.selectedRegion == region[i]{
                    countryCount[i] += 1
                    //
                    totalFood+=1
                }
            }
        }
        for i in 0 ..< countryCount.count {
            percentFood[i] = countryCount[i] / totalFood
            print(percentFood[i])
        }
        
    }
    
    var body: some View {
        ZStack {
            Color.init(hue: 0.123, saturation: 0.46, brightness: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("曾經吃過的食物分佈")
                    .foregroundColor(.black)
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker(selection: $selectedChart, label: Text("分析圖表")) {
                    ForEach(self.chart, id: \.self) { (Chart) in
                        Text(Chart)
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                
//                legend() // 圖例
                VStack{
                    HStack{
                        Circle()
                            .fill(Color.red)
                            .frame(width: 20, height: 20)
                        Text("台北市"+String(format: "%.1f", percentFood[0] * 100) + "%").foregroundColor(.black)
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 20, height: 20)
                        Text("新北市"+String(format: "%.1f", percentFood[1] * 100) + "%").foregroundColor(.black)
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 20, height: 20)
                        Text("桃園市"+String(format: "%.1f", percentFood[2] * 100) + "%").foregroundColor(.black)
                    }
                    HStack{
                        Circle()
                            .fill(Color.green)
                            .frame(width: 20, height: 20)
                        Text("台中市"+String(format: "%.1f", percentFood[3] * 100) + "%").foregroundColor(.black)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Text("台南市"+String(format: "%.1f", percentFood[4] * 100) + "%").foregroundColor(.black)
                        Circle()
                            .fill(Color(hue: 0.627, saturation: 1.0, brightness: 1.0))
                            .frame(width: 20, height: 20)
                        Text("高雄市"+String(format: "%.1f", percentFood[5] * 100) + "%").foregroundColor(.black)
                        
                    }
                    
                }
                if self.selectedChart == "圓餅圖" {
                    PieChartView(percentages: countryCount)
                    .frame(width: 400, height: 300)
                }
                else if self.selectedChart == "柱狀圖" {
                    BarChartView(typeWidths: countryCount)
                    .frame(width: 400, height: 300)
                }
            }.foregroundColor(Color("Color"))
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(countryData: CountriesData())
    }
}
