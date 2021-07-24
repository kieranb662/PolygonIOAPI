// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/19/21.
//
// Author: Kieran Brown
//

import Foundation

// MARK: - Tickers
public struct Tickers: Codable, Equatable {
    public let page, perPage, count: Int?
    public let status: String?
    public let tickers: [Ticker]?

    public init(page: Int?, perPage: Int?, count: Int?, status: String?, tickers: [Ticker]?) {
        self.page = page
        self.perPage = perPage
        self.count = count
        self.status = status
        self.tickers = tickers
    }
    // MARK: - Ticker
    public struct Ticker: Codable, Equatable {
        public let ticker, name, market, locale: String?
        public let currency: String?
        public let active: Bool?
        public let primaryExch, type: String?
        public let codes: Codes?
        public let updated: String?
        public let url: String?
        public let attrs: Attrs?

        public init(ticker: String?, name: String?, market: String?, locale: String?, currency: String?, active: Bool?, primaryExch: String?, type: String?, codes: Codes?, updated: String?, url: String?, attrs: Attrs?) {
            self.ticker = ticker
            self.name = name
            self.market = market
            self.locale = locale
            self.currency = currency
            self.active = active
            self.primaryExch = primaryExch
            self.type = type
            self.codes = codes
            self.updated = updated
            self.url = url
            self.attrs = attrs
        }
    }
    
    // MARK: - Attrs
    public struct Attrs: Codable, Equatable {
        public let currencyName, currency, baseName, base: String?

        public init(currencyName: String?, currency: String?, baseName: String?, base: String?) {
            self.currencyName = currencyName
            self.currency = currency
            self.baseName = baseName
            self.base = base
        }
    }

    // MARK: - Codes
    public struct Codes: Codable, Equatable {
        public let cik, figiuid, scfigi, cfigi: String?
        public let figi: String?

        public init(cik: String?, figiuid: String?, scfigi: String?, cfigi: String?, figi: String?) {
            self.cik = cik
            self.figiuid = figiuid
            self.scfigi = scfigi
            self.cfigi = cfigi
            self.figi = figi
        }
    }
}

