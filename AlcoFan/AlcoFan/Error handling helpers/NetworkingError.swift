//
//  NetworkingError.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case pathEqualToNil
    case cannotCastPathToUrl
    case internalError
    case dataEqualToNil
    case invalidResponse
    case invalidHttpResponseStatusCode
    case jsonDecoderError
    case unexpectedError
    case unab
}
