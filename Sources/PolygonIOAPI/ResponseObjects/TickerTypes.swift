// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public struct TickerTypeResults: Codable, Equatable {
    public var status: String
    public var types: TickerTypes
    public var indexTypes: TickerIndexTypes
    
    public init(status: String, types: TickerTypes, indexTypes: TickerIndexTypes) {
        self.status = status
        self.types = types
        self.indexTypes = indexTypes
    }
}
public typealias TickerTypes = [String: String]
public typealias TickerIndexTypes = [String: String]
