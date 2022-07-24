//
//  DetailCell.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import UIKit

class CellType1: UITableViewCell {
    static let detailCellIdentifier = "CellType1"
    
    @IBOutlet weak var logo1: UIImageView!
    @IBOutlet weak var logo2: UIImageView!
    @IBOutlet weak var logo3: UIImageView!
    
    @IBOutlet weak var fund1: UILabel!
    @IBOutlet weak var fund2: UILabel!
    @IBOutlet weak var fund3: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
    let cell = CellType1VM()
    
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
    
    
    func updateData(detailViewModel : [DetailCellViewModel]){
        cell.updateImage = { [weak self] index,data in
            DispatchQueue.main.async {
                switch index {
                case 0:
                    self?.logo1.image = UIImage(data: data)
                    break;
                case 1:
                    self?.logo2.image = UIImage(data: data)
                    break;
                case 2:
                    self?.logo3.image = UIImage(data: data)
                default:
                    print("error")
                }
            }
        }
        
        cell.updateTitle = { [weak self]index, title in
            switch index{
            case 0:
                self?.fund1.text = title
                break;
            case 1:
                self?.fund2.text = title
                break;
            case 2:
                self?.fund3.text = title
                break;
            default:
                print("error")
            }
        }
        
        cell.updateData(detailViewModel: detailViewModel)
        
    }
    
}
