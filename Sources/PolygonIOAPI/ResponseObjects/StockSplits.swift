// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public struct StockSplits: Codable, Equatable  {
    public let status: String?
    public let count: Int?
    public let results: [Result]?
    
    public init(status: String?, count: Int?, results: [Result]?) {
        self.status = status
        self.count = count
        self.results = results
    }
    
    public struct Result: Codable, Equatable  {
        public let ticker, exDate, paymentDate, declaredDate: String?
        public let ratio: Double?
        public let tofactor, forfactor: Int?
        
        public init(ticker: String?,
            exDate: String?,
            paymentDate: String?,
            declaredDate: String?,
            ratio: Double?,
            tofactor: Int?,
            forfactor: Int?) {
            self.ticker = ticker
            self.exDate = exDate
            self.paymentDate = paymentDate
            self.declaredDate = declaredDate
            self.ratio = ratio
            self.tofactor = tofactor
            self.forfactor = forfactor
        }
    }
}
