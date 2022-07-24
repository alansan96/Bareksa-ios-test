//
//  DetailCellViewModel.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import Foundation


class DetailCellViewModel{
    var image: String?
    var title: String?
    var type: String? // jenis reksadana
    var totalUnit : Int?
    var nav: Double?
    var danaKelola: String?// dana kelola = nav *total unit
    var imbalHasil: String? // imbal hasil
    var minSubs: String?// min pembelian
    var riskPriority: String?// tingkat resiko
    var inceptionDate : String? // tanggal peluncuran
    var jangkaWaktu: String? // jangka waktu
    
    var dataImage:Data?
    
    func getAllAdditionalData(product : Details){
        getRiskPriority()
        getJangkaWaktu()
        getDanaKelola()
        getInceptionDate(product: product)
        getImbalHasil(product: product)
    }
    
    func getRiskPriority(){
        if type == "Saham"{
            riskPriority = "Tinggi"
        }else {
            riskPriority = "Rendah"
        }
    }
    
    func getJangkaWaktu(){
        if type == "Saham"{
            jangkaWaktu = "5 Tahun"
        }else {
            jangkaWaktu = "1 Tahun"
        }
    }
    
    func getDanaKelola(){
        guard let nav = nav,
              let totalUnit = totalUnit else {return}
        
        let danaDouble = nav * Double(totalUnit)
        
        if danaDouble > 1000000000000 {
            danaKelola = "\((danaDouble / 1000000000000).rounded(toPlaces: 2)) Triliun"
        }else if danaDouble > 1000000000{
            danaKelola = "\((danaDouble / 1000000000).rounded(toPlaces: 2)) Miliar"
        }else if danaDouble > 1000000{
            danaKelola = "\((danaDouble / 1000000).rounded(toPlaces: 2)) Juta"
        }else{
            danaKelola = "\(danaDouble.rounded(toPlaces: 0))"
        }
        
        if let danaKelola = danaKelola {
            if danaKelola.contains("."){
                self.danaKelola = danaKelola.replacingOccurrences(of: ".", with: ",")
            }
        }
    }
    
    func getInceptionDate(product : Details){
        let dateString = product.inceptionDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "d MMM y"
        let resultString = dateFormatter.string(from: date!)
        //        print(resultString)
        
        inceptionDate = resultString
        
    }
    
    func getImbalHasil(product: Details){
        if type == "Saham"{
            imbalHasil = "\(product.returnFiveYear)% / 5 thn"
        }else {
            imbalHasil = "\(product.returnOneYear)% / thn"
        }
    }
}
