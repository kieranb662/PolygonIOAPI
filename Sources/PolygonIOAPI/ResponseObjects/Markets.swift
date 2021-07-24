// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - Markets
public struct Markets: Codable, Equatable {
    public let status: String?
    public let results: [Result]?
    
    public init(status: String?, results: [Result]?) {
        self.status = status
        self.results = results
    }
    
    // MARK: - Result
    public struct Result: Codable, Equatable {
        public let market: String?
        /// Description
        public let desc: String?
        
        public init(market: String?, desc: String?) {
            self.market = market
            self.desc = desc
        }
    }
}

