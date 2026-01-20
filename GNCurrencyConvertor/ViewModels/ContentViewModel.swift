//
//  ContentViewModel.swift
//  GNCurrencyConvertor
//
//  Created by joe on 1/14/26.
//

import Foundation

// conversion formula = conversion rate / base exchange rate * base amount

@Observable
class ContentViewModel {
    var convertedAmount = 1.0
    var baseAmount = 1.0
    var baseCurrency: CurrencyChoice = .Usa
    var convertedCurrency: CurrencyChoice = .Usa
    var rates: Rates?
    var isLoading = false
    var errorMessage = ""
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }
    
    func fetchRates() async {
        guard let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=f976a852d7944994af2a0ff1ce11ffc5") else {
            errorMessage = "Could not fetch rates."
            print("API url is not valid.")
            return
        }
        let urlRequest = URLRequest(url: url)
        isLoading = true
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            rates = try JSONDecoder().decode(Rates.self, from: data)
        } catch {
            errorMessage = "Could not fetch rates."
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func convert() {
        if let rates, let baseExchangeRate = rates.rates[baseCurrency.rawValue],
           let convertedExchangeRate = rates.rates[convertedCurrency.rawValue] {
            convertedAmount = (convertedExchangeRate / baseExchangeRate) * baseAmount
        }
    }
}
