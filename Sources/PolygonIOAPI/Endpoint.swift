// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

public struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    public init(path: String, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.queryItems = queryItems
    }
}

public extension Endpoint {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

extension Endpoint {
    public func urlRequest(baseUrl: String = "api.polygon.io", keyProvider: APIKeyProvider?) -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        components.path = path
        var queryItems = self.queryItems
        if let key = keyProvider?.key {
            queryItems = queryItems + [URLQueryItem(name: "apiKey", value: key)]
        }
        components.queryItems = queryItems
        return URLRequest(url: components.url ?? .init(fileURLWithPath: ""))
    }
}

extension Endpoint {
    
    /// Query all ticker symbols which are supported by Polygon.io. Returns basic reference data for each matched ticker symbol.
    /// This API includes Crypto, Forex, and Stocks/Equities.
    /// - Parameters:
    ///   - search: Search for specific tickers by name or ticker symbol.
    ///   - perPage: The maximum number of results to be returned on each page, max 50 and default 50.
    ///   - page: Which page of results to return.
    /// - Returns: `Tickers`
    static func tickers(search: String?, perPage: Int = 50, page: Int = 1) -> Endpoint {
        return Endpoint(
            path: "/v2/reference/tickers",
            queryItems: [
                URLQueryItem(name: "sort", value: "ticker"),
                URLQueryItem(name: "search", value: search),
                URLQueryItem(name: "perpage", value: "\(perPage)"),
                URLQueryItem(name: "page", value: "\(page)")
            ])
    }
    /// Get a list of historical dividends for a stock, including the relevant dates and the amount of the dividend.
    /// - Parameter symbol: The ticker symbol of the company to search
    /// - returns: `Dividends` object
    static func companyDividends(for symbol: String) -> Endpoint {
        return Endpoint(path: "/v2/reference/dividends/\(symbol.preProcess())")
    }
    /// Get details for a ticker symbol's company/entity. This provides a general overview of the entity with information such as name,
    /// sector, exchange, logo and similar companies.
    /// - Parameter symbol: The ticker symbol of the entity to search.
    /// - returns: `TickerDetails` Object
    static func tickerDetails(for symbol: String) -> Endpoint {
        return Endpoint(path: "/v1/meta/symbols/\(symbol.preProcess())/company")
    }
    /// Get a mapping of ticker types to their descriptive names.
    /// - returns: `TickerTypeResults`
    static let tickerTypes = Endpoint(path: "/v2/reference/types")
    /// Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for a single traded stock ticker.
    ///
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.
    /// This can happen as early as 4am EST.
    /// - returns: `SnapshotData`
    static func realtimeData(for symbol: String) -> Endpoint {
        return Endpoint(path: "/v2/snapshot/locale/us/markets/stocks/tickers/\(symbol.preProcess())")
    }
    /// Get NBBO quotes for a given ticker symbol on a specified date.
    /// - Parameters:
    ///   - symbol: The ticker symbol we want quotes for.
    ///   - date: The date/day of the quotes to retrieve in the format YYYY-MM-DD.
    ///   - reverseResults: Reverse the order of the results.  (**default**: true)
    ///   - limit: Limit the size of the response, max 50000 and default 5000.
    static func quotes(
        for symbol: String, date: Date, reverseResults: Bool = true, limit: Int = 5000) -> Endpoint {
        return Endpoint(
            path: "/v2/ticks/stocks/nbbo/\(symbol.preProcess())/\(dateFormatter.string(from: date))",
            queryItems: [
                URLQueryItem(name: "reverse", value: String(reverseResults)),
                URLQueryItem(name: "limit", value: String(limit))
            ])
    }
    /// Get trades for a given ticker symbol on a specified date.
    /// - Parameters:
    ///   - symbol: The ticker symbol we want trades for.
    ///   - date: The date/day of the trades to retrieve in the format YYYY-MM-DD.
    ///   - reverseResults: Reverse the order of the results. (**default**: true)
    ///   - limit: Limit the size of the response, max 50000 and default 5000.
    /// - Returns: `TradeData`
    static func trades(
        for symbol: String, date: Date, reverseResults: Bool = true, limit: Int = 10) -> Endpoint {
        return Endpoint(
            path: "/v2/ticks/stocks/trades/\(symbol.preProcess())/\(dateFormatter.string(from: date))",
            queryItems: [
                URLQueryItem(name: "reverse", value: String(reverseResults)),
                URLQueryItem(name: "limit", value: String(limit))
            ])
    }
    /// Get the open, close and afterhours prices of a stock symbol on a certain date.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - date: The date of the requested open/close in the format YYYY-MM-DD.
    /// - returns: `DailyOpenClose`
    static func dailyOpenAndClose(for symbol: String, date: Date) -> Endpoint {
        return Endpoint(path: "/v1/open-close/\(symbol.preProcess())/\(dateFormatter.string(from: date))")
    }
    /// Get the most recent trade for a given stock.
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `LastTrade`
    static func lastTrade(for symbol: String) -> Endpoint {
        return Endpoint(path: "/v1/last/stocks/\(symbol.preProcess())")
    }
    /// Get the most recent quote tick for a given stock.
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `LastQuote`
    static func lastQuote(for symbol: String) -> Endpoint {
        return Endpoint(path: "/v1/last_quote/stocks/\(symbol.preProcess())")
    }
    /// Get the daily open, high, low, and close (OHLC) for the entire stocks/equities markets.
    /// - Parameters:
    ///   - date: The beginning date for the aggregate window.
    ///   - unadjusted: Whether or not the results are adjusted for splits. By default, results are adjusted. Set this to true to get
    ///   results that are NOT adjusted for splits.
    /// - returns: `GroupedDailyBars`
    static func groupedDailyBars(on date: Date, unadjusted: Bool) -> Endpoint  {
        return Endpoint(
            path: "/v2/aggs/grouped/locale/us/market/stocks/\(dateFormatter.string(from: date))",
            queryItems: [URLQueryItem(name: "unadjusted", value: unadjusted.description)])
    }
    /// Get the previous day's open, high, low, and close (OHLC) for the specified stock ticker.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - unadjusted: Whether or not the results are adjusted for splits. By default, results are adjusted. Set this to true to get
    ///   results that are NOT adjusted for splits.
    /// - returns: `PreviousClose`
    static func previousClose(for symbol: String, unadjusted: Bool) -> Endpoint {
        return Endpoint(
            path: "/v2/aggs/ticker/\(symbol.preProcess())/prev",
            queryItems: [URLQueryItem(name: "unadjusted", value: unadjusted.description)])
    }
    /// Get aggregate bars for a stock over a given date range in custom time window sizes.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - multiplier: The size of the timespan multiplier.
    ///   - timespan: The size of the time window.
    ///   - from: The start of the aggregate time window.
    ///   - to: The end of the aggregate time window.
    ///   - unadjusted: Whether or not the results are adjusted for splits. By default, results are adjusted. Set this to true to get
    ///   results that are NOT adjusted for splits.
    ///   - sort: Sort the results by timestamp. asc will return results in ascending order (oldest at the top), desc will return results
    ///   in descending order (newest at the top).
    ///   - limit: Limits the number of base aggregates queried to create the aggregate results. Max 50000 and Default 5000.
    /// - returns: `Aggregates`
    static func aggregates(
        for symbol: String, multiplier: Int, timespan: Timespan, from: Date, to: Date, unadjusted: Bool, sort: BarSortMethod, limit: Int) -> Endpoint {
        return Endpoint(
            path: "/v2/aggs/ticker/\(symbol.preProcess())/range/\(multiplier)/\(timespan.rawValue)/\(dateFormatter.string(from: from))/\(dateFormatter.string(from: to))",
            queryItems: [
                URLQueryItem(name: "unadjusted", value: unadjusted.description),
                URLQueryItem(name: "sort", value: sort.rawValue),
                URLQueryItem(name: "limit", value: limit.description)
            ])
    }
    /// Get the current top 20 gainers or losers of the day in stocks/equities markets.
    ///
    /// - Top gainers are those tickers whose price has increased by the highest percentage since the previous day's close.
    /// - Top losers are those tickers whose price has decreased by the highest percentage since the previous day's close.
    /// - Parameter direction: The direction of the snapshot results to return.
    /// - returns: `GainersLosers`
    static func snapshotGainersLosers(direction: Direction) -> Endpoint {
        return Endpoint(path: "/v2/snapshot/locale/us/markets/stocks/\(direction.rawValue)")
    }
    /// Get the most recent news articles relating to a stock ticker symbol, including a summary of the article and a link to the original source.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - itemsPerPage: The maximum number of results to be returned on each page, max 50 and default 50.
    ///   - pageNumber: Which page of results to return.
    /// - returns: `TickerNews`
    static func news(
        for symbol: String = "AAPL", itemsPerPage: Int = 50, pageNumber: Int = 1) -> Endpoint {
        return Endpoint(
            path: "/v1/meta/symbols/\(symbol.preProcess())/news",
            queryItems: [
                URLQueryItem(name: "perpage", value: String(itemsPerPage)),
                URLQueryItem(name: "page", value: String(pageNumber))
            ])
    }
    /// Get a unified numerical mapping for conditions on trades and quotes.
    ///
    ///  Each feed/exchange uses its own set of codes to identify conditions, so the same condition may have a different code
    ///  depending on the originator of the data. Polygon.io defines its own mapping to allow for uniformly identifying a condition
    ///  across feeds/exchanges.
    ///  - parameter type: The type of ticks to return mappings for. (trades or quotes)
    /// - returns: `ConditionMappings`
    static func conditionMappings(type: TickType) -> Endpoint {
        return Endpoint(path: "/v1/meta/conditions/\(type.rawValue)")
    }
    /// Get a list of stock exchanges which are supported by Polygon.io.
    /// - returns: `ExchangeMappings`
    static var exchanges: Endpoint {
        return Endpoint(path: "/v1/meta/exchanges")
    }
    /// Get upcoming market holidays and their open/close times.
    /// - returns: `MarketHolidays`
    static var marketHolidays: Endpoint {
        return Endpoint(path: "/v1/marketstatus/upcoming")
    }
    /// Get a list of historical stock splits for a ticker symbol, including the execution and payment dates of the stock split, and the split ratio.
    ///   - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `StockSplits`
    static func stockSplitsQuery(_ symbol: String) -> Endpoint {
        return Endpoint(path: "/v2/reference/splits/\(symbol.preProcess())")
    }
    /// Get historical financial data for a stock ticker.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - limit: Limit the number of results.
    ///   - reportType: Year, year annualized, quarter, quarter annualized, trailing twelve months, trailing twelve months annualized
    ///   - sortMethod: The direction to sort the returned results.
    /// - returns: `StockTickerFinancials`
    static func stockFinancials(
        for symbol: String, limit: Int, type: FinancialReportType, method: SortMethod) -> Endpoint {
        return Endpoint(
            path: "/v2/reference/financials/\(symbol.preProcess())",
            queryItems: [
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "type", value: type.rawValue),
                URLQueryItem(name: "sort", value: method.rawValue)
            ])
    }
}
