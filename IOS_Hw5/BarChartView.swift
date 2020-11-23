//
//  BarChartView.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct BarChartView: View {
    var typeWidths: [Double]

    var body: some View {
        HStack {
            BarChart(Width: typeWidths[0])
                .foregroundColor(.red)
            BarChart(Width: typeWidths[1])
                .foregroundColor(.orange)
            BarChart(Width: typeWidths[2])
                .foregroundColor(.yellow)
            BarChart(Width: typeWidths[3])
                .foregroundColor(.green)
            BarChart(Width: typeWidths[4])
                .foregroundColor(.blue)
            BarChart(Width: typeWidths[5])
                .foregroundColor(Color(hue: 0.627, saturation: 1.0, brightness: 1.0))
        }//.frame(width: 400, height: 500)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(typeWidths: [2, 10, 10, 10, 10, 10, 10])
    }
}

