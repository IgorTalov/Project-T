//
//  ParameterEncoding.swift
//  Project T
//
//  Created by Игорь Талов on 25/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}



public enum NetworkError: String, Error {
    case parameterNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding fail"
    case missingURL = "URL is nil"
}
