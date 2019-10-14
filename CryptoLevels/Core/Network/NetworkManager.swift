//
//  NetworkManager.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation
import Combine

// swiftlint:disable all
class NetworkManager {
    func fire<Output: JSONDecodable>(at url: URL, output: Output.Type) -> AnyPublisher<Output, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .map({ output.init(json: JSONComposer.compose($0)) })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
