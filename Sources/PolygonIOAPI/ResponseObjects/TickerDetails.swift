// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public struct TickerDetails: Codable, Equatable {
    
    /// The URL of the entity's logo.
    public let logo: String?
    /// The date that the symbol was listed on the exchange.
    public let listdate: String?
    /// The official CIK guid used for SEC database/filings.
    public let cik: String?
    /// The Bloomberg guid for the symbol.
    public let bloomberg: String?
    /// The OpenFigi project guid for the symbol. (https://openfigi.com/)
    public let figi: String?
    /// The Legal Entity Identifier (LEI) guid for the symbol.
    /// (https://en.wikipedia.org/wiki/Legal_Entity_Identifier)
    public let lei: String?
    /// Standard Industrial Classification (SIC) id for the symbol.
    /// (https://en.wikipedia.org/wiki/Legal_Entity_Identifier)
    public let sic: Int?
    /// The country in which the company is registered.
    public let country: String?
    /// The industry in which the company operates.
    public let industry: String?
    /// The sector of the indsutry in which the symbol operates.
    public let sector: String?
    /// The current market cap for the company.
    public let marketcap: Int?
    /// The approximate number of employees for the company.
    public let employees: Int?
    /// The phone number for the company. This is usually a corporate contact number.
    public let phone: String?
    /// The name of the company's current CEO.
    public let ceo: String?
    /// The URL of the company's website
    public let url: String?
    /// A description of the company and what they do/offer.
    public let description:String?
    /// The symbol's primary exchange.
    public let exchange: String?
    /// The name of the company/entity.
    public let name: String?
    /// The exchange symbol that this item is traded under.
    public let symbol: String?
    /// The exchange code (id) of the symbol's primary exchange.
    public let exchangeSymbol: String?
    /// The street address for the company's headquarters.
    public let hqAddress: String?
    /// The state in which the company's headquarters is located.
    public let hqState: String?
    /// The country in which the company's headquarters is located.
    public let hqCountry: String?
    /// The type or class of the security. (Full List of Ticker Types)
    public let type: String?
    /// The last time this company record was updated.
    public let updated: String?
    /// A list of words related to the company.
    public let tags: [String]?
    /// A list of ticker symbols for similar companies.
    public let similar: [String]?
    /// Indicates if the security is actively listed. If false, this means the company is no longer listed and cannot be traded.
    public let active: Bool?
    
    public init(logo: String?,
        listdate: String?,
        cik: String?,
        bloomberg: String?,
        figi: String?,
        lei: String?,
        sic: Int?,
        country: String?,
        industry: String?,
        sector: String?,
        marketcap: Int?,
        employees: Int?,
        phone: String?,
        ceo: String?,
        url: String?,
        description:String?,
        exchange: String?,
        name: String?,
        symbol: String?,
        exchangeSymbol: String?,
        hqAddress: String?,
        hqState: String?,
        hqCountry: String?,
        type: String?,
        updated: String?,
        tags: [String]?,
        similar: [String]?,
        active: Bool?
    ) {
        self.logo = logo
        self.listdate = listdate
        self.cik = cik
        self.bloomberg = bloomberg
        self.figi = figi
        self.lei = lei
        self.sic = sic
        self.country = country
        self.industry = industry
        self.sector = sector
        self.marketcap = marketcap
        self.employees = employees
        self.phone = phone
        self.ceo = ceo
        self.url = url
        self.description = description
        self.exchange = exchange
        self.name = name
        self.symbol = symbol
        self.exchangeSymbol = exchangeSymbol
        self.hqAddress = hqAddress
        self.hqState = hqState
        self.hqCountry = hqCountry
        self.type = type
        self.updated = updated
        self.tags = tags
        self.similar = similar
        self.active = active
    }

    public enum CodingKeys: String, CodingKey {
        case logo, listdate, cik, bloomberg, figi, lei, sic, country, industry, sector, marketcap, employees, phone, ceo, url
        case description
        case exchange, name, symbol, exchangeSymbol
        case hqAddress = "hq_address"
        case hqState = "hq_state"
        case hqCountry = "hq_country"
        case type, updated, tags, similar, active
    }
}
public class JSONNull: Codable, Hashable, Equatable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
