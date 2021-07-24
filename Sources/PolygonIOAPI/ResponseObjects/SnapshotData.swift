// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - RealTimeStockData
public struct SnapshotData: Codable, Equatable  {
    public let status: String?
    public let ticker: Ticker?
    public init(status: String?, ticker: Ticker?) {
        self.status = status
        self.ticker = ticker
    }
    
    // MARK: - Ticker
    public struct Ticker: Codable, Equatable  {
        public let day: Day?
        public let lastQuote: LastQuote?
        public let lastTrade: LastTrade?
        public let min, prevDay: Day?
        public let ticker: String?
        public let todaysChange, todaysChangePerc, updated: Double?
        
        public init(day: Day?,
            lastQuote: LastQuote?,
            lastTrade: LastTrade?,
            min: Day?,
            prevDay: Day?,
            ticker: String?,
            todaysChange: Double?,
            todaysChangePerc: Double?,
            updated: Double?) {
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
        public let c, h, l, o: Double?
        public let v: Int?
        public let vw: Double?
        public let av: Int?
        
        public init(c: Double?,
            h: Double?,
            l: Double?,
            o: Double?,
            v: Int?,
            vw: Double?,
            av: Int?) {
            self.c = c
            self.h = h
            self.l = l
            self.o = o
            self.v = v
            self.vw = vw
            self.av = av
        }
    }

    // MARK: - LastQuote
    public struct LastQuote: Codable, Equatable  {
        public let p: Double?
        public let s: Int?
        public let lastQuoteP: Double?
        public let lastQuoteS: Int?
        public let t: Double?
        
        public init(p: Double?,
            s: Int?,
            lastQuoteP: Double?,
            lastQuoteS: Int?,
            t: Double?) {
            self.p = p
            self.s = s
            self.lastQuoteP = lastQuoteP
            self.lastQuoteS = lastQuoteS
            self.t = t
        }

        public enum CodingKeys: String, CodingKey {
            case p = "P"
            case s = "S"
            case lastQuoteP = "p"
            case lastQuoteS = "s"
            case t
        }
    }

    // MARK: - LastTrade
    public struct LastTrade: Codable, Equatable  {
        public let c: [Int]?
        public let i: String?
        public let p: Double?
        public let s: Int?
        public let t: Double?
        public let x: Int?
        
        public init(
            c: [Int]?,
            i: String?,
            p: Double?,
            s: Int?,
            t: Double?,
            x: Int?) {
            self.c = c
            self.i = i
            self.p = p
            self.s = s
            self.t = t
            self.x = x
        }
        
    }
}


