//
//  CellType2.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import UIKit

class CellType2: UITableViewCell {
    static let detailCellIdentifier = "CellType2"
    
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    let cellType2VM = CellType2VM()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        createCornerRadius(uiView: view1)
        createCornerRadius(uiView: view2)
        createCornerRadius(uiView: view3)
    }
    
    func createCornerRadius(uiView: UIView){
        uiView.layer.cornerRadius = 4
    }
    
    
    func updateData(row: Int, viewModel: [DetailCellViewModel]){
        
        cellType2VM.updateView = { values, title in
            self.titleHeader.text = title
            self.label1.text = values[0]
            self.label2.text = values[1]
            self.label3.text = values[2]
        }
        
        cellType2VM.updateData(indexRow: row, viewModel: viewModel)
        
    }
    
}
