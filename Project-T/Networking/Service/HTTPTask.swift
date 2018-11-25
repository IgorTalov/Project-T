//
//  HTTPTask.swift
//  Project T
//
//  Created by Игорь Талов on 25/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String : String]

public enum HTTPTask {
    case request
    case requestParameter(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders?)
}
