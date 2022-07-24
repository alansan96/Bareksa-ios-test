//
//  ChartModel.swift
//  iOSTest
//
//  Created by Alan Santoso on 22/07/22.
//

import Foundation


// MARK: - ChartData
struct ChartModel: Codable {
    let code: Int
    let message, error: String
    let data: [String: DatumValue]
    let totalData: Int

    enum CodingKeys: String, CodingKey {
        case code, message, error, data
        case totalData = "total_data"
    }
}

// MARK: - DatumValue
struct DatumValue: Codable {
    let data: [DatumElement]
    let error: String
}

// MARK: - DatumElement
struct DatumElement: Codable {
    let date: String
    let value, growth: Double
}
