//
//  JSONComposer.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

class JSONComposer {
    static func compose(_ data: Data) -> JSON {
        do {
           return try JSON(data: data)
        } catch {
            return JSON(parseJSON: "")
        }
    }
}
