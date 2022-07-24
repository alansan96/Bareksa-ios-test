//
//  ViewModel.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import Foundation


class ViewModel{
    let serviceAPI: ServiceAPI?
    var prodcutDetail: ProductDetail?
    var detailCellViewModels: [DetailCellViewModel] = []
    
    var bindData: (([DetailCellViewModel])->()) = {_ in}
    var finishLoadImage: (()->())?
    
    var chartData: [String: DatumValue]?
    
    init(){
        serviceAPI = ServiceAPI()
//        fetchProductDetail()
    }
    
    //PRODUCT DETAILS
    func fetchProductDetail(){
        serviceAPI?.fetchProductDetail { [weak self] eachProduct in
            self?.prodcutDetail = eachProduct
            self?.generateDataForCell()
        }
    }
    
    func generateDataForCell(){
        guard let prodcutDetail = prodcutDetail else {return}
        var detailCellVMTemp = [DetailCellViewModel]()
        
        for datum in prodcutDetail.data{
            let product = datum.details
            detailCellVMTemp.append(createDetailCellViewModel(product: product))
        }
        
        detailCellViewModels = detailCellVMTemp
        self.bindData(detailCellViewModels)
    }
    
    func createDetailCellViewModel(product : Details) -> DetailCellViewModel{
        let detailCellVM = DetailCellViewModel()
        detailCellVM.image = product.imAvatar
        detailCellVM.title = product.imName
        detailCellVM.type = product.type
        detailCellVM.nav = product.nav
        detailCellVM.totalUnit = product.totalUnit
        detailCellVM.minSubs = "\(product.minSubscription)"
        detailCellVM.getAllAdditionalData(product: product)
        
        return detailCellVM
    }
    
    //CHART DATA
    func fetchChartData(){
        serviceAPI?.downloadChartData(completionHandler: { [weak self] chartModel in
            self?.chartData = chartModel.data
        })
    }
    
}
