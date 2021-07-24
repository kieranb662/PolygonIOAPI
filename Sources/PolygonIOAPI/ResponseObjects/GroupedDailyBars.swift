// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - GroupedDailyBars
public struct GroupedDailyBars: Codable, Equatable  {
    /// The number of aggregates (minute or day) used to generate the response.
    public let queryCount: Int?
    /// The total number of results for this request.
    public let resultsCount: Int?
    /// Whether or not this response was adjusted for splits.
    public let adjusted: Bool?
    public let results: [Result]?
    public let status, requestID: String?
    public let count: Int?

    public enum CodingKeys: String, CodingKey {
        case queryCount, resultsCount, adjusted, results, status
        case requestID = "request_id"
        case count
    }

    public init(queryCount: Int?, resultsCount: Int?, adjusted: Bool?, results: [Result]?, status: String?, requestID: String?, count: Int?) {
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
        /// The exchange symbol that this item is traded under.
        public let exchangeSymbol: String?
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

        public enum CodingKeys: String, CodingKey {
            case exchangeSymbol = "T"
            case volume = "v"
            case volumeWeightedAveragePrice = "vw"
            case openPrice = "o"
            case closePrice = "c"
            case highestPrice = "h"
            case lowestPrice = "l"
            case timestamp = "t"
            case numberOfItemsInAggregateWindow = "n"
        }

        public init(t: String?, v: Int?, vw: Double?, o: Double?, c: Double?, h: Double?, l: Double?, resultT: Int?, n: Int?) {
            self.exchangeSymbol = t
            self.volume = v
            self.volumeWeightedAveragePrice = vw
            self.openPrice = o
            self.closePrice = c
            self.highestPrice = h
            self.lowestPrice = l
            self.timestamp = resultT
            self.numberOfItemsInAggregateWindow = n
        }
    }

}

