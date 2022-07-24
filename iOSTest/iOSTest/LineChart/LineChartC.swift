//
//  LineChartC.swift
//  iOSTest
//
//  Created by Alan Santoso on 23/07/22.
//

import UIKit

class LineChartC: UIViewController {

    @IBOutlet weak var chartView: UIView!
    
    var chartModelData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ServiceAPI().downloadChartData { chartModel in
            chartModel.data.forEach { key,value in
                if key == "KI002MMCDANCAS00"{
                    value.data.forEach { datumElement in
                        self.chartModelData.append("\(datumElement.value)")
                    }
                }
            }
//            print(self.chartModelData)
        }
        
    }


}
