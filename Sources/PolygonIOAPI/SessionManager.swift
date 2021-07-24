// Swift toolchain version 5.0
// Running macOS version 11.1
// Created on 2/8/21.
//
// Author: Kieran Brown
//

import Combine
import Foundation

public protocol SessionManagerProtocol {
    func execute<T>(_ endpoint: Endpoint, baseURL: String) -> AnyPublisher<T, Error> where T : Decodable
}

public class SessionManager: SessionManagerProtocol {
    /// The underlying session.
    internal let session: URLSession
    internal let decoder = JSONDecoder()
    var apiKeyProvider: APIKeyProvider?
    
    public init(configuration: URLSessionConfiguration = .default) {
        let cacheMemorySize = 4 * 1024 * 1024 // 4 MB
        configuration.urlCache = URLCache(memoryCapacity: cacheMemorySize, diskCapacity: 0, diskPath: nil)
        configuration.requestCachePolicy = .useProtocolCachePolicy
        self.session = URLSession(configuration: configuration)
    }
    
    public func execute<T>(
        _ endpoint: Endpoint, baseURL: String
    ) -> AnyPublisher<T, Error> where T : Decodable {
        return session
            .dataTaskPublisher(for: endpoint.urlRequest(baseUrl: baseURL, keyProvider: apiKeyProvider))
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    deinit {
        // Clear cache to avoid memory leaks
        session.configuration.urlCache?.removeAllCachedResponses()
        // Invalide session to free its delegate and captured resources to avoid leaks
        session.finishTasksAndInvalidate()
    }
}
