// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public typealias ExchangeMappings = [ExchangeMapElement]

public struct ExchangeMapElement: Codable, Equatable {
    /// The ID of the exchange.
    public let id: Int?
    /// The type of exchange.
    ///
    /// TRF = Trade Reporting Facility
    /// exchange = Reporting exchange on the tape
    public let type: String?
    /// The market data type that this exchange contains.
    public let market: String?
    /// The Market Identification Code or MIC as defined in ISO 10383 (https://en.wikipedia.org/wiki/Market_Identifier_Code).
    public let mic: String?
    /// The name of the exchange.
    public let name: String?
    /// The tape id of the exchange.
    public let tape: String?
    public let code: String?
    public init(id: Int?, type: String?, market: String?, mic: String?, name: String?, tape: String?, code: String?){
        self.id = id
        self.type = type
        self.market = market
        self.mic = mic
        self.name = name
        self.tape = tape
        self.code = code
    }
}
