// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - Aggregates
public struct Aggregates: Codable, Equatable {
    public let ticker: String?
    public let queryCount, resultsCount: Int?
    public let adjusted: Bool?
    public let results: [Result]?
    public let status, requestID: String?
    public let count: Int?
    public enum CodingKeys: String, CodingKey {
        case ticker, queryCount, resultsCount, adjusted, results, status
        case requestID = "request_id"
        case count
    }
    public init(ticker: String?, queryCount: Int?, resultsCount: Int?, adjusted: Bool?, results: [Result]?, status: String?, requestID: String?, count: Int?) {
        self.ticker = ticker
        self.queryCount = queryCount
        self.resultsCount = resultsCount
        self.adjusted = adjusted
        self.results = results
        self.status = status
        self.requestID = requestID
        self.count = count
    }
    // MARK: - Result
    public struct Result: Codable, Equatable  {
        /// The trading volume of the symbol in the given time period.
        public let volume: Int?
        /// The volume weighted average price.
        public let volumeWeightedAveragePrice: Double?
        /// The open price for the symbol in the given time period.
        public let openPrice: Double?
        /// The close price for the symbol in the given time period.
        public let closePrice: Double?
        /// The highest price for the symbol in the given time period.
        public let highestPrice: Double?
        /// The lowest price for the symbol in the given time period.
        public let lowestPrice: Double?
        /// The Unix Msec timestamp for the start of the aggregate window.
        public let timestamp: Int?
        /// The number of items in the aggregate window.
        public let numberOfItemsInAggregateWindow: Int?
        enum CodingKeys: String, CodingKey {
            case volume = "v"
            case volumeWeightedAveragePrice = "vw"
            case openPrice = "o"
            case closePrice = "c"
            case highestPrice = "h"
            case lowestPrice = "l"
            case timestamp = "t"
            case numberOfItemsInAggregateWindow = "n"
        }
       public init(v: Int?, vw: Double?, o: Double?, c: Double?, h: Double?, l: Double?, t: Int?, n: Int?) {
            self.volume = v
            self.volumeWeightedAveragePrice = vw
            self.openPrice = o
            self.closePrice = c
            self.highestPrice = h
            self.lowestPrice = l
            self.timestamp = t
            self.numberOfItemsInAggregateWindow = n
        }
    }

}

