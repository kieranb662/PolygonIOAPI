// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - GainersLosers
public struct GainersLosers: Codable, Equatable  {
    public let status: String?
    public let tickers: [Ticker]?
    
    public init(status: String?, tickers: [Ticker]?) {
        self.status = status
        self.tickers = tickers
    }
    
    // MARK: - Ticker
    public struct Ticker: Codable, Equatable  {
        public let day: Day?
        public let lastQuote: LastQuote?
        public let lastTrade: LastTrade?
        /// The last available minute bar.
        public let min: Day?
        public let prevDay: Day?
        public let ticker: String?
        /// The value of the change the from previous day.
        public let todaysChange: Double?
        /// The percentage change since the previous day.
        public let todaysChangePerc: Double?
        /// The last updated timestamp.
        public let updated: Double?
        
        public init(day: Day?, lastQuote: LastQuote?, lastTrade: LastTrade?, min: Day?, prevDay: Day?, ticker: String?, todaysChange: Double?, todaysChangePerc: Double?, updated: Double?) {
            self.day = day
            self.lastQuote = lastQuote
            self.lastTrade = lastTrade
            self.min = min
            self.prevDay = prevDay
            self.ticker = ticker
            self.todaysChange = todaysChange
            self.todaysChangePerc = todaysChangePerc
            self.updated = updated
        }
    }
    
    // MARK: - Day
    public struct Day: Codable, Equatable  {
        /// The close price for the symbol in the given time period.
        public let closePrice: Double?
        /// The highest price for the symbol in the given time period.
        public let highestPrice: Double?
        /// The lowest price for the symbol in the given time period.
        public let lowestPrice: Double?
        /// The open price for the symbol in the given time period.
        public let openPrice: Double?
        /// The trading volume of the symbol in the given time period.
        public let volume: Int?
        /// Volume weighted average price.
        public let volumeWeightedAverage: Double?
        /// The accumulated volume.
        public let accumulatedVolume: Int?
        
        enum CodingKeys: String, CodingKey {
            case closePrice = "c"
            case highestPrice = "h"
            case lowestPrice = "l"
            case openPrice = "o"
            case volume = "v"
            case volumeWeightedAverage = "vw"
            case accumulatedVolume = "av"
        }
        
        public init(c: Double?, h: Double?, l: Double?, o: Double?, v: Int?, vw: Double?, av: Int?) {
            self.closePrice = c
            self.highestPrice = h
            self.lowestPrice = l
            self.openPrice = o
            self.volume = v
            self.volumeWeightedAverage = vw
            self.accumulatedVolume = av
        }
    }
    
    // MARK: - LastQuote
    public struct LastQuote: Codable, Equatable  {
        /// The bid price.
        public let bidPrice: Double?
        /// The bid size in lots.
        public let bidSize: Int?
        /// The ask price.
        public let askPrice: Double?
        /// The ask size in lots.
        public let askSize: Int?
        /// The Unix Msec timestamp for the start of the aggregate window.
        public let timestamp: Double?
        
        public enum CodingKeys: String, CodingKey {
            case bidPrice = "P"
            case bidSize = "S"
            case askPrice = "p"
            case askSize = "s"
            case timestamp = "t"
        }
        
        public init(p: Double?, s: Int?, lastQuoteP: Double?, lastQuoteS: Int?, t: Double?) {
            self.bidPrice = p
            self.bidSize = s
            self.askPrice = lastQuoteP
            self.askSize = lastQuoteS
            self.timestamp = t
        }
    }
    
    // MARK: - LastTrade
    public struct LastTrade: Codable, Equatable  {
        /// The trade conditions.
        public let tradeConditions: [Int]?
        /// The trade ID.
        public let id: String?
        /// The price of the trade.
        public let price: Double?
        /// The size (volume) of the trade.
        public let volume: Int?
        /// The Unix Msec timestamp for the start of the aggregate window.
        public let timestamp: Double?
        /// The exchange ID. See Exchanges for Polygon.io's mapping of exchange IDs.
        public let exchangeId: Int?
        
        
        public enum CodingKeys: String, CodingKey {
            case tradeConditions = "c"
            case id = "i"
            case price = "p"
            case volume = "s"
            case timestamp = "t"
            case exchangeId = "x"
        }
        
        public init(c: [Int]?, i: String?, p: Double?, s: Int?, t: Double?, x: Int?) {
            self.tradeConditions = c
            self.id = i
            self.price = p
            self.volume = s
            self.timestamp = t
            self.exchangeId = x
        }
    }
    
}
