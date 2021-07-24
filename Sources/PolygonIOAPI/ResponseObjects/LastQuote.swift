// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - LastQuote
public struct LastQuote: Codable, Equatable  {
    public let symbol, status, requestID: String?
    public let last: Last?

    public enum CodingKeys: String, CodingKey {
        case symbol, status
        case requestID = "request_id"
        case last
    }

    public init(symbol: String?, status: String?, requestID: String?, last: Last?) {
        self.symbol = symbol
        self.status = status
        self.requestID = requestID
        self.last = last
    }
    // MARK: - Last
    public struct Last: Codable, Equatable  {
        public let askexchange: Int?
        public let askprice: Double?
        public let asksize, bidexchange: Int?
        public let bidprice: Double?
        public let bidsize, timestamp: Int?

        public init(askexchange: Int?, askprice: Double?, asksize: Int?, bidexchange: Int?, bidprice: Double?, bidsize: Int?, timestamp: Int?) {
            self.askexchange = askexchange
            self.askprice = askprice
            self.asksize = asksize
            self.bidexchange = bidexchange
            self.bidprice = bidprice
            self.bidsize = bidsize
            self.timestamp = timestamp
        }
    }

}

