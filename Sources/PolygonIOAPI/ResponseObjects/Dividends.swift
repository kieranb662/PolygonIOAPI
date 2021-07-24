// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation


// MARK: - Dividends
public struct Dividends: Codable, Equatable  {
    public let status: String?
    public let count: Int?
    public let results: [Result]?
    
    public init(status: String?, count: Int?, results: [Result]?) {
        self.status = status
        self.count = count
        self.results = results
    }
    
    
    // MARK: - Result
    public struct Result: Codable, Equatable  {
        public let ticker, exDate, paymentDate, recordDate: String?
        public let amount: Double?
        
        public init(ticker: String?, exDate: String?, paymentDate: String?, recordDate: String?, amount: Double?) {
            self.ticker = ticker
            self.exDate = exDate
            self.paymentDate = paymentDate
            self.recordDate = recordDate
            self.amount = amount
        }
    }
}

