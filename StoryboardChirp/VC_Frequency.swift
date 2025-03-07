//
//  ViewController_Frequency.swift
//  StoryboardChirp
//
//  Created by Bolin Wu on 5/8/23.
//

import SwiftUI
import UIKit
import Charts
import AVFoundation
import Accelerate

extension ViewController {
    
    @IBAction func freqButtonPress(_ sender: Any) {
        checkMassChange()
        removeViews()
        // self.uiview.removeFromSuperview()

        uiview.isHidden = false
        xAxisLabel.isHidden = true
        yAxisLabel.isHidden = true
        
     //   xAxisLabel.text = "Time (s)"
      //  yAxisLabel.text = "Frequency (Hz)"
        
//        chartView = LineChartView()
        
        chartView.frame = frameRect
        chartView.center   = windowFrame.center
        
        view.addSubview(chartView)
        
        let set = LineChartDataSet(entries: testChirp.freqDataEntries())
        set.drawCirclesEnabled = false
        set.colors = [NSUIColor](repeating: .systemBlue, count: set.colors.count)
        set.lineWidth = 5
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        
        let xAxisLabel = UILabel()
                xAxisLabel.text = "Time (seconds)"
                xAxisLabel.textAlignment = .center
                xAxisLabel.translatesAutoresizingMaskIntoConstraints = false
                windowFrame.addSubview(xAxisLabel)
                
                let yAxisLabel = UILabel()
                yAxisLabel.text = "Frequency (Hz)"
                yAxisLabel.textAlignment = .center
                yAxisLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
                yAxisLabel.translatesAutoresizingMaskIntoConstraints = false
                windowFrame.addSubview(yAxisLabel)
        
        //xAxisLabel.center = chartView.center
        //yAxisLabel.center = chartView.center
        
        NSLayoutConstraint.activate([
                // X axis label constraints
                xAxisLabel.bottomAnchor.constraint(equalTo: windowFrame.bottomAnchor, constant: -14),
                xAxisLabel.centerXAnchor.constraint(equalTo: windowFrame.centerXAnchor),

                // Y axis label constraints
                yAxisLabel.leadingAnchor.constraint(equalTo: windowFrame.leadingAnchor, constant: -35),
                yAxisLabel.centerYAnchor.constraint(equalTo: windowFrame.centerYAnchor, constant: -23)
            ])
        
        chartView.data = data
        
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.axisLineColor = NSUIColor.lightGray
        chartView.xAxis.labelTextColor = .black
        
        chartView.leftAxis.axisLineColor = NSUIColor.lightGray
        chartView.leftAxis.labelTextColor = .black

        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
//
        chartView.legend.enabled = false
        
        chartView.animate(xAxisDuration: 2.5)
    }
}
