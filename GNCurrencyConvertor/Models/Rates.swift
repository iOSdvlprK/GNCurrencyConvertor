//
//  Rates.swift
//  GNCurrencyConvertor
//
//  Created by joe on 1/18/26.
//

import Foundation

struct Rates: Decodable {
    let rates: [String: Double]
}
