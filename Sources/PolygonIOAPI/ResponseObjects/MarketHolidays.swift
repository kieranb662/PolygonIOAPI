// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public typealias MarketHolidays = [MarketHoliday]

public struct MarketHoliday: Codable, Equatable  {
    public let exchange, name, date, status: String?
    public let marketHolidayOpen, close: String?
    
    public init(exchange: String?, name: String?, date: String?, status: String?, marketHolidayOpen: String?, close: String?) {
        self.exchange = exchange
        self.name = name
        self.date = date
        self.status = status
        self.marketHolidayOpen = marketHolidayOpen
        self.close = close
    }

    public enum CodingKeys: String, CodingKey {
        case exchange, name, date, status
        case marketHolidayOpen = "open"
        case close
    }
}
