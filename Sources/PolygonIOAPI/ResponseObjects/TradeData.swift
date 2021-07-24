// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - TradeData
public struct TradeData: Codable, Equatable {
    public let results: [Result]?
    /// Whether or not this query was executed successfully.
    public let success: Bool?
    /// A mapping of the keys returned in the results to their descriptive name and data types.
    public let map: Map?
    /// The exchange symbol that this item is traded under.
    public let ticker: String?
    /// The total number of results for this request.
    public let resultsCount: Int?
    /// Latency in milliseconds for the query results from the database.
    public let dbLatency: Int?
    
    public init(
        results: [Result]?,
        success: Bool?,
        map: Map?,
        ticker: String?,
        resultsCount: Int?,
        dbLatency: Int?
    ) {
        self.results = results
        self.success = success
        self.map = map
        self.ticker = ticker
        self.resultsCount = resultsCount
        self.dbLatency = dbLatency
    }
    public enum CodingKeys: String, CodingKey {
        case results, success, map, ticker
        case resultsCount = "results_count"
        case dbLatency = "db_latency"
    }
    // MARK: - Map
    public struct Map: Codable, Equatable {
        public let t, f, mapI, i: I?
        public let x, p, z, y: I?
        public let q, c, e, r: I?
        public let s: I?
        
        public init(t: I?, f: I?, mapI: I?, i: I?, x: I?, p: I?, z: I?, y: I?, q: I?, c: I?, e: I?, r: I?, s: I?) {
            self.t = t
            self.f = f
            self.mapI = mapI
            self.i = i
            self.x = x
            self.p = p
            self.z = z
            self.y = y
            self.q = q
            self.c = c
            self.e = e
            self.r = r
            self.s = s
        }
        
       public enum CodingKeys: String, CodingKey {
            case t, f
            case mapI = "i"
            case i = "I"
            case x, p, z, y, q, c, e, r, s
        }
    }
    // MARK: - I
    public struct I: Codable, Equatable {
        public let name, type: String?
        public init(name: String?, type: String?) {
            self.name = name
            self.type = type
        }
    }
    public enum ResultType: Equatable {
        case string, int, int64, float64
    }
    // MARK: - Result
    public struct Result: Codable, Equatable {
        public let t, y: Int64?
        public let q: Int?
        public let i: String?
        public let x, s: Int?
        public let c: [Int]?
        public let p: Double?
        public let z: Int?
        public let f: Int64?
        public let r: Int?
        public let I: Int?
        public let e: Int?
        
        public init(t: Int64?, y: Int64?, q: Int?, i: String?, x: Int?, s: Int?, c: [Int]?, p: Double?, z: Int?, f: Int64?, r: Int?, I: Int?, e: Int?) {
            self.t = t
            self.y = y
            self.q = q
            self.i = i
            self.x = x
            self.s = s
            self.c = c
            self.p = p
            self.z = z
            self.f = f
            self.r = r
            self.I = I
            self.e = e
        }
    }
}
