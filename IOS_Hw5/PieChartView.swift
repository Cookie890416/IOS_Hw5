//
//  PieChartView.swift
//  IOS_Hw5
//
//  Created by User10 on 2020/11/22.
//

import SwiftUI

struct PieChartView: View {
    var percentages:[Double]?
    var angles: [Angle]
        init(percentages: [Double]){
        var sum: Double = 0
        var finalpercentage: [Double] = [0,0,0,0,0,0]
        for i in 0..<6 {
         sum = sum + percentages[i]
        }
        
        for j in 0..<6 {
            finalpercentage[j] = percentages[j] / sum
        }
        
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in finalpercentage {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage
        }
    }
    
    var body: some View {
        ZStack {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.red)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.orange)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[3])
                .fill(Color.yellow)
            PieChart(startAngle: self.angles[3], endAngle: self.angles[4])
                .fill(Color.green)
            PieChart(startAngle: self.angles[4], endAngle: self.angles[5])
                .fill(Color.blue)
            PieChart(startAngle: self.angles[5], endAngle: self.angles[0])
                .fill(Color(hue: 0.627, saturation: 1.0, brightness: 1.0))
        }.frame(width: 300, height: 300)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [5, 10, 15, 20, 25, 25])
    }
}
