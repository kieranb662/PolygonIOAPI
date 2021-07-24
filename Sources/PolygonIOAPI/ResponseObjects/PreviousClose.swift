// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - PreviousClose
public struct PreviousClose: Codable, Equatable  {
    public let ticker, status: String?
    /// The number of aggregates (minute or day) used to generate the response.
    public let queryCount: Int?
    /// The total number of results for this request.
    public let resultsCount: Int?
    public let adjusted: Bool?
    public let results: [Result]?
    /// A request id assigned by the server.
    public let requestID: String?

    public enum CodingKeys: String, CodingKey {
        case ticker, status, queryCount, resultsCount, adjusted, results
        case requestID = "request_id"
    }

    public init(ticker: String?, status: String?, queryCount: Int?, resultsCount: Int?, adjusted: Bool?, results: [Result]?, requestID: String?) {
        self.ticker = ticker
        self.status = status
        self.queryCount = queryCount
        self.resultsCount = resultsCount
        self.adjusted = adjusted
        self.results = results
        self.requestID = requestID
    }
    
    // MARK: - Result
    public struct Result: Codable, Equatable  {
        /// Ticker Symbol
        public let tickerSymbol: String?
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
        public let resultT: Int?

        public enum CodingKeys: String, CodingKey {
            case tickerSymbol = "T"
            case volume = "v"
            case volumeWeightedAveragePrice = "vw"
            case openPrice = "o"
            case closePrice = "c"
            case highestPrice = "h"
            case lowestPrice = "l"
            case resultT = "t"
        }

        public init(t: String?, v: Int?, vw: Double?, o: Double?, c: Double?, h: Double?, l: Double?, resultT: Int?) {
            self.tickerSymbol = t
            self.volume = v
            self.volumeWeightedAveragePrice = vw
            self.openPrice = o
            self.closePrice = c
            self.highestPrice = h
            self.lowestPrice = l
            self.resultT = resultT
        }
    }
}

