//
//  NerworkingErrorChecker.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

class NetworkingErrorChecker {
    static func valid(_ data: Data?, _ response: URLResponse?, _ error: Error?) throws {
        guard error == nil else {
            throw NetworkingError.internalError
        }
        guard data != nil else {
            throw NetworkingError.dataEqualToNil
        }
        guard let hhtpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse
        }
        guard hhtpResponse.statusCode == 200 else {
            throw NetworkingError.invalidHttpResponseStatusCode
        }
    }
}
