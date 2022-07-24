//
//  CellType3.swift
//  iOSTest
//
//  Created by Alan Santoso on 22/07/22.
//

import UIKit

class CellType3: UITableViewCell {
    static let detailCellIdentifier = "CellType3"
    
    @IBOutlet weak var detail1: UIButton!
    @IBOutlet weak var detail2: UIButton!
    @IBOutlet weak var detail3: UIButton!
    
    @IBOutlet weak var beli1: UIButton!
    @IBOutlet weak var beli2: UIButton!
    @IBOutlet weak var beli3: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        createBorderButton(button: detail1)
        createBorderButton(button: detail2)
        createBorderButton(button: detail3)
        createCornerRadius(button: beli1)
        createCornerRadius(button: beli2)
        createCornerRadius(button: beli3)
    }
    
    func createBorderButton(button : UIButton){
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(hexString: "#4B8B26").cgColor
    }
    
    func createCornerRadius(button : UIButton){
        button.layer.cornerRadius = 4
    }

}
