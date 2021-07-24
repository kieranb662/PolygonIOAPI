// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 2/8/21.
//
// Author: Kieran Brown
//

import Foundation

/// Provides access token.
public class APIKeyProvider {
    
    /// API key for polygon.io
    public var key: String?
    
    /// Creates a new instance from given parameters.
    ///
    /// - Parameter key: Api key
    ///
    public init(key: String? = nil) {
        self.key = key
    }
    
}
