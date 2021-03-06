import Foundation
import Combine

public class PolygonIO {
    private var apiKeyProvider = APIKeyProvider()
    public let sessionManager: SessionManager
    public let baseURL: String

    public init(apiKey: String? = nil,
                baseURL: String = "api.polygon.io",
                sessionManager: SessionManager = SessionManager()) {
        self.sessionManager = sessionManager
        self.baseURL = baseURL
        self.apiKeyProvider.key = apiKey
        self.sessionManager.apiKeyProvider = apiKeyProvider
    }
}

public extension PolygonIO {
    /// Query all ticker symbols which are supported by Polygon.io. Returns basic reference data for each matched ticker symbol.
    /// This API includes Crypto, Forex, and Stocks/Equities.
    /// - Parameters:
    ///   - search: Search for specific tickers by name or ticker symbol.
    ///   - perPage: The maximum number of results to be returned on each page, max 50 and default 50.
    ///   - page: Which page of results to return.
    /// - Returns: `Tickers`
    func tickers(search: String?, perPage: Int = 50, page: Int = 1) -> AnyPublisher<Tickers, Error> {
        return sessionManager.execute(.tickers(search: search, perPage: perPage, page: page), baseURL: baseURL)
    }
    /// Get a list of historical dividends for a stock, including the relevant dates and the amount of the dividend.
    /// - Parameter symbol: The ticker symbol of the company to search
    /// - returns: `Dividends` object
    func companyDividends(for symbol: String) -> AnyPublisher<Dividends, Error> {
        return sessionManager.execute(.companyDividends(for: symbol), baseURL: baseURL)
    }
    /// Get details for a ticker symbol's company/entity. This provides a general overview of the entity with information such as name,
    /// sector, exchange, logo and similar companies.
    /// - Parameter symbol: The ticker symbol of the entity to search.
    /// - returns: `TickerDetails` Object
    func tickerDetails(for symbol: String) -> AnyPublisher<TickerDetails, Error> {
        return sessionManager.execute(.tickerDetails(for: symbol), baseURL: baseURL)
    }
    /// Get a mapping of ticker types to their descriptive names.
    /// - returns: `TickerTypeResults`
    func tickerTypes() -> AnyPublisher<TickerTypeResults, Error>  {
        return sessionManager.execute(.tickerTypes, baseURL: baseURL)
    }
    /// Get the current minute, day, and previous day???s aggregate, as well as the last trade and quote for a single traded stock ticker.
    ///
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.
    /// This can happen as early as 4am EST.
    /// - returns: `SnapshotData`
    func realtimeData(for symbol: String) -> AnyPublisher<SnapshotData, Error>  {
        return sessionManager.execute(.realtimeData(for: symbol), baseURL: baseURL)
    }
    /// Get NBBO quotes for a given ticker symbol on a specified date.
    /// - Parameters:
    ///   - symbol: The ticker symbol we want quotes for.
    ///   - date: The date/day of the quotes to retrieve in the format YYYY-MM-DD.
    ///   - reverseResults: Reverse the order of the results.  (**default**: true)
    ///   - limit: Limit the size of the response, max 50000 and default 5000.
    func quotes(
        for symbol: String, date: Date, reverseResults: Bool = true, limit: Int = 5000) -> AnyPublisher<Data, Error>  {
        return sessionManager.execute(.quotes(for: symbol, date: date, reverseResults: reverseResults, limit: limit), baseURL: baseURL)
    }
    /// Get trades for a given ticker symbol on a specified date.
    /// - Parameters:
    ///   - symbol: The ticker symbol we want trades for.
    ///   - date: The date/day of the trades to retrieve in the format YYYY-MM-DD.
    ///   - reverseResults: Reverse the order of the results. (**default**: true)
    ///   - limit: Limit the size of the response, max 50000 and default 5000.
    /// - Returns: `TradeData`
    func trades(
        for symbol: String, date: Date, reverseResults: Bool = true, limit: Int = 10) -> AnyPublisher<TradeData, Error> {
        return sessionManager.execute(.quotes(for: symbol, date: date, reverseResults: reverseResults, limit: limit), baseURL: baseURL)
    }
    /// Get the open, close and afterhours prices of a stock symbol on a certain date.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - date: The date of the requested open/close in the format YYYY-MM-DD.
    /// - returns: `DailyOpenClose`
    func dailyOpenAndClose(for symbol: String, date: Date) ->  AnyPublisher<DailyOpenClose, Error> {
        return sessionManager.execute(.dailyOpenAndClose(for: symbol, date: date), baseURL: baseURL)
    }
    /// Get the most recent trade for a given stock.
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `LastTrade`
    func lastTrade(for symbol: String) -> AnyPublisher<LastTrade, Error>  {
        return sessionManager.execute(.lastTrade(for: symbol), baseURL: baseURL)
    }
    /// Get the most recent quote tick for a given stock.
    /// - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `LastQuote`
    func lastQuote(for symbol: String) -> AnyPublisher<LastQuote, Error>  {
        return sessionManager.execute(.lastQuote(for: symbol), baseURL: baseURL)
    }
    /// Get the daily open, high, low, and close (OHLC) for the entire stocks/equities markets.
    /// - Parameters:
    ///   - date: The beginning date for the aggregate window.
    ///   - unadjusted: Whether or not the results are adjusted for splits. By default, results are adjusted. Set this to true to get
    ///   results that are NOT adjusted for splits.
    /// - returns: `GroupedDailyBars`
    func groupedDailyBars(on date: Date, unadjusted: Bool) -> AnyPublisher<GroupedDailyBars, Error>  {
        return sessionManager.execute(.groupedDailyBars(on: date, unadjusted: unadjusted), baseURL: baseURL)
    }
    /// Get the previous day's open, high, low, and close (OHLC) for the specified stock ticker.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - unadjusted: Whether or not the results are adjusted for splits. By default, results are adjusted. Set this to true to get
    ///   results that are NOT adjusted for splits.
    /// - returns: `PreviousClose`
    func previousClose(for symbol: String, unadjusted: Bool) -> AnyPublisher<PreviousClose, Error>  {
        return sessionManager.execute(.previousClose(for: symbol, unadjusted: unadjusted), baseURL: baseURL)
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
    func aggregates(
        for symbol: String, multiplier: Int, timespan: Timespan, from: Date, to: Date, unadjusted: Bool, sort: BarSortMethod, limit: Int) -> AnyPublisher<Aggregates, Error>  {
        return sessionManager.execute(.aggregates(for: symbol, multiplier: multiplier, timespan: timespan, from: from, to: to, unadjusted: unadjusted, sort: sort, limit: limit), baseURL: baseURL)
    }
    /// Get the current top 20 gainers or losers of the day in stocks/equities markets.
    ///
    /// - Top gainers are those tickers whose price has increased by the highest percentage since the previous day's close.
    /// - Top losers are those tickers whose price has decreased by the highest percentage since the previous day's close.
    /// - Parameter direction: The direction of the snapshot results to return.
    /// - returns: `GainersLosers`
    func snapshotGainersLosers(direction: Direction) -> AnyPublisher<GainersLosers, Error>  {
        return sessionManager.execute(.snapshotGainersLosers(direction: direction), baseURL: baseURL)
    }
    /// Get the most recent news articles relating to a stock ticker symbol, including a summary of the article and a link to the original source.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - itemsPerPage: The maximum number of results to be returned on each page, max 50 and default 50.
    ///   - pageNumber: Which page of results to return.
    /// - returns: `TickerNews`
    func news(
        for symbol: String = "AAPL", itemsPerPage: Int = 50, pageNumber: Int = 1) -> AnyPublisher<TickerNews, Error>  {
        return sessionManager.execute(.news(for: symbol, itemsPerPage: itemsPerPage, pageNumber: pageNumber), baseURL: baseURL)
    }
    /// Get a unified numerical mapping for conditions on trades and quotes.
    ///
    ///  Each feed/exchange uses its own set of codes to identify conditions, so the same condition may have a different code
    ///  depending on the originator of the data. Polygon.io defines its own mapping to allow for uniformly identifying a condition
    ///  across feeds/exchanges.
    ///  - parameter type: The type of ticks to return mappings for. (trades or quotes)
    /// - returns: `ConditionMappings`
    func conditionMappings(type: TickType) -> AnyPublisher<ConditionMappings, Error>  {
        return sessionManager.execute(.conditionMappings(type: type), baseURL: baseURL)
    }
    /// Get a list of stock exchanges which are supported by Polygon.io.
    /// - returns: `ExchangeMappings`
    var exchanges: AnyPublisher<ExchangeMappings, Error>  {
        return sessionManager.execute(.exchanges, baseURL: baseURL)
    }
    /// Get upcoming market holidays and their open/close times.
    /// - returns: `MarketHolidays`
    var marketHolidays: AnyPublisher<MarketHoliday, Error>  {
        return sessionManager.execute(.marketHolidays, baseURL: baseURL)
    }
    /// Get a list of historical stock splits for a ticker symbol, including the execution and payment dates of the stock split, and the split ratio.
    ///   - parameter symbol: The ticker symbol of the stock/equity.
    /// - returns: `StockSplits`
    func stockSplitsQuery(_ symbol: String) -> AnyPublisher<StockSplits, Error>  {
        return sessionManager.execute(.stockSplitsQuery(symbol), baseURL: baseURL)
    }
    /// Get historical financial data for a stock ticker.
    /// - Parameters:
    ///   - symbol: The ticker symbol of the stock/equity.
    ///   - limit: Limit the number of results.
    ///   - reportType: Year, year annualized, quarter, quarter annualized, trailing twelve months, trailing twelve months annualized
    ///   - sortMethod: The direction to sort the returned results.
    /// - returns: `StockTickerFinancials`
    func stockFinancials(
        for symbol: String, limit: Int, type: FinancialReportType, method: SortMethod) -> AnyPublisher<StockTickerFinancials, Error>  {
        return sessionManager.execute(.stockFinancials(for: symbol, limit: limit, type: type, method: method), baseURL: baseURL)
    }
}

public enum TickType: String, CaseIterable {
    case trades
    case quotes
}

public enum FinancialReportType: String, CaseIterable {
    case year = "Y"
    case yearAnnualized = "YA"
    case quarter = "Q"
    case quarterAnnualized = "QA"
    case trailingTwelveMonths = "T"
    case trailingTwelveMonthsAnnualized = "TA"
}

public enum SortMethod: String, CaseIterable {
    case reportPeriod = "reportPeriod"
    case minusReportPeriod = "-reportPeriod"
    case calendarDate = "calendarDate"
    case minusCalendarDate = "-calendarDate"
}

public enum Timespan: String, CaseIterable {
    case minute
    case hour
    case day
    case week
    case month
    case quarter
    case year
}

public enum Direction: String, CaseIterable {
    case gainers
    case losers
}

public enum BarSortMethod: String, CaseIterable {
    case ascending = "asc"
    case descending = "desc"
}

