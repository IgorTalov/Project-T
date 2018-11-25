//
//  EndPointType.swift
//  Project T
//
//  Created by Игорь Талов on 25/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
