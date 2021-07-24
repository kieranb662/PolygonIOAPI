// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - DailyOpenClose
public struct DailyOpenClose: Codable, Equatable  {
    /// The status of this request's response.
    public let status: String?
    /// The requested date.
    public let from: String?
    /// The exchange symbol that this item is traded under.
    public let symbol: String?
    /// The open price for the symbol in the given time period.
    public let open: Double?
    /// The highest price for the symbol in the given time period.
    public let high: Double?
    /// The lowest price for the symbol in the given time period.
    public let low: Double?
    /// The close price for the symbol in the given time period.
    public let close: Double?
    /// The trading volume of the symbol in the given time period.
    public let volume: Int?
    /// The close price of the ticker symbol in after hours trading.
    public let afterHours: Double?
    /// The open price of the ticker symbol in pre-market trading.
    public let preMarket: Double?
    
   public init(
        status: String?,
        from: String?,
        symbol: String?,
        open: Double?,
        high: Double?,
        low: Double?,
        close: Double?,
        volume: Int?,
        afterHours: Double?,
        preMarket: Double?) {
        self.status = status
        self.from = from
        self.symbol = symbol
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.volume = volume
        self.afterHours = afterHours
        self.preMarket = preMarket 
    }
}
