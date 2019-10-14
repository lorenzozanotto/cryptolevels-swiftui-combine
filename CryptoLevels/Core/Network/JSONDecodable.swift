//
//  JSONDecodable.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

public protocol JSONDecodable {
    init(json: JSON)
}
