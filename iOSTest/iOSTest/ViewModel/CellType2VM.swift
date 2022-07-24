//
//  CellType2VM.swift
//  iOSTest
//
//  Created by Alan Santoso on 22/07/22.
//

import Foundation

class CellType2VM{
    
    var updateView: (([String],String)->()) = {_,_ in } //[value], title
    let titleString = ["Jenis reksa dana", "Imbal hasil", "Dana kelolaan", "Min. pembelian", "Jangka waktu", "Tingkat risiko", "Peluncuran"]
    
    var value = ["", "", ""]
    
    init(){}
    
    func updateData(indexRow: Int,viewModel: [DetailCellViewModel]){
        for i in 0..<viewModel.count {
            switch indexRow{
            case 1:
                value[i] = viewModel[i].type ?? ""
            case 2:
                value[i] = viewModel[i].imbalHasil ?? ""
            case 3:
                value[i] = viewModel[i].danaKelola ?? ""
            case 4:
                value[i] = viewModel[i].minSubs ?? ""
            case 5:
                value[i] = viewModel[i].jangkaWaktu ?? ""
            case 6:
                value[i] = viewModel[i].riskPriority ?? ""
            case 7:
                value[i] = viewModel[i].inceptionDate ?? ""
                
            default:
                print("error")
            }
            
            updateView(value, titleString[i])
        }
    }
    
}
