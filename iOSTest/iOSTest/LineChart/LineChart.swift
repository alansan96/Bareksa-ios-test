//
//  LineChart.swift
//  iOSTest
//
//  Created by Alan Santoso on 23/07/22.
//

import UIKit

class LineChart: UIView {
    
    let sampleData = [1394.21, 1394.36, 1394.55, 1395.34, 1395.48, 1395.67, 1395.76, 1395.89, 1396.35, 1396.62, 1396.56, 1396.79, 1396.94, 1397.64, 1397.76, 1398.0, 1398.2, 1398.44, 1398.96, 1399.08, 1399.37, 1399.48, 1399.66, 1400.32, 1400.47, 1400.67, 1400.87, 1401.04, 1401.84, 1401.92, 1401.92, 1402.25, 1402.82, 1402.81, 1402.99, 1403.08, 1403.33, 1403.91, 1404.49, 1404.81, 1404.99, 1405.23, 1405.98, 1406.22, 1407.06, 1407.1, 1407.23, 1406.94, 1406.98, 1407.22, 1407.51, 1407.57, 1407.57, 1407.61, 1408.27, 1408.48, 1408.65, 1408.51, 1408.41, 1409.06, 1409.17, 1409.32, 1409.47, 1409.61, 1410.28, 1410.48, 1410.67, 1410.86, 1411.06, 1411.61, 1411.7, 1411.8, 1411.75, 1411.76, 1412.62, 1412.94, 1413.23, 1413.55, 1413.41, 1413.89, 1413.96, 1414.1, 1414.49, 1414.48, 1415.3, 1415.5, 1415.46, 1415.62, 1416.12, 1416.89, 1417.24, 1418.41, 1418.9, 1419.35, 1419.57, 1420.04, 1420.64, 1420.93, 1421.11, 1421.19, 1421.36, 1421.95, 1421.9, 1421.4, 1421.84, 1421.85, 1422.39, 1422.64, 1423.12, 1423.29, 1423.65, 1424.35, 1424.34, 1424.56, 1424.64, 1424.67, 1425.11, 1425.13, 1425.5, 1425.84, 1426.41, 1425.56, 1425.49, 1425.52, 1425.49, 1425.87, 1425.82, 1425.7, 1426.44, 1426.39, 1426.5, 1427.28, 1427.89, 1427.83, 1427.79, 1427.57, 1428.05, 1428.35, 1428.66, 1428.82, 1428.71, 1428.74, 1428.79, 1428.86, 1428.98, 1429.08, 1429.5, 1429.59, 1429.71, 1429.89, 1430.29, 1430.83, 1431.04, 1431.62, 1431.62, 1431.49, 1431.88, 1431.87, 1432.05, 1432.07, 1432.56, 1432.48, 1432.64, 1433.09, 1433.37, 1433.91, 1434.22, 1434.58, 1434.95, 1435.14, 1436.12, 1436.4, 1437.07, 1437.12, 1437.22, 1437.36, 1437.59, 1437.39, 1437.94, 1438.49, 1438.8, 1438.17, 1437.93, 1437.9, 1438.52, 1438.94, 1439.15, 1439.77, 1440.15, 1440.54, 1440.52, 1440.46, 1440.86, 1441.9, 1442.1, 1442.59, 1442.96, 1442.74, 1443.48, 1443.58, 1443.5, 1443.84, 1444.12, 1444.58, 1444.29, 1444.38, 1443.84, 1443.77, 1444.8, 1445.21, 1445.26, 1445.35, 1445.39, 1445.88, 1446.11, 1446.47, 1447.03, 1446.94, 1447.26, 1447.43, 1448.76, 1448.84, 1448.94, 1449.24, 1449.46, 1449.86, 1450.08, 1450.41, 1450.57, 1451.13, 1451.97, 1452.0, 1452.21, 1452.57, 1452.75, 1453.11, 1452.92, 1453.21, 1453.96, 1454.16, 1454.15, 1453.92]
    
    let sampleDataEasy = [4,5,8,10]
    
    override func draw(_ rect: CGRect) {
        createHorizontalBackground()
        createVerticalMiddleLine()
        testing()
    }
    
    func createHorizontalBackground(){
        let height = self.frame.height
        let width = self.frame.width
        
        for i in 0..<9{
            let float = Double(i)
            let startY = (height / 8) * CGFloat(float)
            
            let lineLayer = CAShapeLayer()
            let midX = self.frame.width / 2
            
            lineLayer.strokeColor = UIColor.gray.cgColor
            lineLayer.lineWidth = 1
            let path = CGMutablePath()
            path.addLines(between: [CGPoint(x: 0, y: startY),
                                    CGPoint(x: width, y: startY)])
            
            lineLayer.path = path
            self.layer.addSublayer(lineLayer)
        }
        
        
    }
    
    func createVerticalMiddleLine(){
        let lineLayer = CAShapeLayer()
        let midX = self.frame.width / 2
        
        lineLayer.strokeColor = UIColor.gray.cgColor
        lineLayer.lineWidth = 1
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: midX, y: 0),
                                CGPoint(x: midX, y: self.frame.height)])
        lineLayer.path = path
        self.layer.addSublayer(lineLayer)
        
        
    }
    
    func testing(){
        
        //[4,5,6,7,8,9,10,15]
        guard let minValue = sampleData.first,
              let maxValue = sampleData.last else {return} // bikin kepaling bawah kiri
        
        let gapMinToMax = maxValue - minValue
        let gapMinToMaxFloat = Double(gapMinToMax)
        
        for i in 0..<sampleData.count-1{
            let iFloat = Double(i)
            let height = self.frame.height
            let width = self.frame.width
            
            let currValue = Double(sampleData[i])
            let nextCurrValue = Double(sampleData[i+1])
            let highValue = Double(maxValue)
            let lowValue = Double(minValue)

            
            
            
            var eachYStart = height - ((height * (currValue-lowValue)) / (highValue - lowValue))
            var eachYEnd = height - ((height * (nextCurrValue-lowValue)) / (highValue - lowValue))

            
            let lineLayer = CAShapeLayer()
            
            lineLayer.strokeColor = UIColor.red.cgColor
            lineLayer.lineWidth = 2
            let path = CGMutablePath()
            path.addLines(between: [CGPoint(x: (width / Double(sampleData.count-1)) * iFloat   , y: eachYStart),
                                    CGPoint(x: (width / Double(sampleData.count-1)) * (iFloat + 1), y: eachYEnd)])
            
            print("(\(width * iFloat),\(eachYStart))    (\(width * (iFloat+1)),\(eachYEnd)")
            
            lineLayer.path = path
            self.layer.addSublayer(lineLayer)
        }
        
    }
    
}


