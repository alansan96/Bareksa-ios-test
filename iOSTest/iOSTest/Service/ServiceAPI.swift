//
//  ServiceAPI.swift
//  iOSTest
//
//  Created by Alan Santoso on 21/07/22.
//

import Foundation



class ServiceAPI{
    init (){}
    
    func fetchProductDetail(completionHandler: @escaping (ProductDetail)->()){
        guard let url = URL(string: "https://ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io/takehometest/apps/compare/detail?productCodes=KI002MMCDANCAS00&productCodes=TP002EQCEQTCRS00&productCodes=NI002EQCDANSIE00") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                let productDetail = try JSONDecoder().decode(ProductDetail.self, from: data)
                completionHandler(productDetail)
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func downloadImage(from urlString: String , completion: @escaping (Data) -> ()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                completion(data)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func downloadChartData(completionHandler: @escaping((ChartModel)->())){
        guard let url = URL(string: "https://ae1cdb19-2532-46fa-9b8f-cce01702bb1e.mock.pstmn.io/takehometest/apps/compare/chart?productCodes=KI002MMCDANCAS00&productCodes=TP002EQCEQTCRS00&productCodes=NI002EQCDANSIE00") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                let chartModel = try JSONDecoder().decode(ChartModel.self, from: data)
                completionHandler(chartModel)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
