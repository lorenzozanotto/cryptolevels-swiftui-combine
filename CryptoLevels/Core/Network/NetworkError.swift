//
//  NetworkError.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case missingConnection
    case errorFetchingData
    case unsupportedUrl
    
    static func map(_ error: URLError) -> NetworkError {
        switch error.errorCode {
        case NSURLErrorUnsupportedURL:
            return unsupportedUrl
        case NSURLErrorNotConnectedToInternet:
            return missingConnection
        default:
            return errorFetchingData
        }
    }
}
