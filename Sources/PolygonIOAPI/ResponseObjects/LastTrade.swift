// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - LastTrade
public struct LastTrade: Codable, Equatable  {
    public let last: Last?
    public let requestID, status, symbol: String?

    public enum CodingKeys: String, CodingKey {
        case last
        case requestID = "request_id"
        case status, symbol
    }

    public init(last: Last?, requestID: String?, status: String?, symbol: String?) {
        self.last = last
        self.requestID = requestID
        self.status = status
        self.symbol = symbol
    }
    // MARK: - Last
    public struct Last: Codable, Equatable  {
        public let cond1, exchange: Int?
        public let price: Double?
        public let size, timestamp: Int?

        public init(cond1: Int?, exchange: Int?, price: Double?, size: Int?, timestamp: Int?) {
            self.cond1 = cond1
            self.exchange = exchange
            self.price = price
            self.size = size
            self.timestamp = timestamp
        }
    }

}

