//
//  ContentViewModel.swift
//  GNCurrencyConvertor
//
//  Created by joe on 1/14/26.
//

import Foundation

@Observable
class ContentViewModel {
    var convertedAmount = 1.0
    var baseAmount = 1.0
    var baseCurrency: CurrencyChoice = .Usa
    var convertedCurrency: CurrencyChoice = .Usa
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }
}
