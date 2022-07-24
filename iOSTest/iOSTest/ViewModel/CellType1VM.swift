//
//  CellType1VM.swift
//  iOSTest
//
//  Created by Alan Santoso on 22/07/22.
//

import Foundation


class CellType1VM {
    
    let serviceAPI: ServiceAPI
    var updateImage: ((Int,Data)->()) = {_,_ in}
    var updateTitle:((Int, String)->()) = {_,_ in}
    
    var title:String?
    
    init(){
        serviceAPI = ServiceAPI()
    }
    
    func updateData(detailViewModel : [DetailCellViewModel]){
        var index = 0
        var indexImage = 0
        
        for eachVM in detailViewModel{
            if let title = eachVM.title{
                updateTitle(index,title)
            }
            
            serviceAPI.downloadImage(from: eachVM.image ?? "") { data in
                self.updateImage(indexImage, data)
                indexImage += 1
            }
            index += 1
        }
    }

    
    
}
