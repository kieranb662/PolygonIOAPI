// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 1/13/21.
//
// Author: Kieran Brown
//

import Foundation

public struct TickerNew: Codable, Equatable {
    public let symbols: [String]?
    public let timestamp, title: String?
    public let url: String?
    public let source, summary: String?
    public let image: String?
    public let keywords: [String]?
    
    public init(
        symbols: [String]?,
        timestamp: String?,
        title: String?,
        url: String?,
        source: String?,
        summary: String?,
        image: String?,
        keywords: [String]?
    ) {
        self.symbols = symbols
        self.timestamp = timestamp
        self.title = title
        self.url = url
        self.source = source
        self.summary = summary
        self.image = image
        self.keywords = keywords
    }
}

public typealias TickerNews = [TickerNew]

extension TickerNew: Identifiable {
    public var id: String {
        summary ?? "ASDASFDSF"
    }
}
