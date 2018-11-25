//
//  TinkoffStocksEndPoint.swift
//  Project T
//
//  Created by Игорь Талов on 25/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

enum NetworkingEnvironment {
    case qa
    case production
    case staging
}

public enum StocksApi {
    case allCurrentStocks()
    case getCompanyLogo(symbols: String)
}

extension StocksApi: EndPointType {

    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .qa:
            return "https://api.iextrading.com/1.0/"
        case .production:
            return "https://api.iextrading.com/1.0/"
        case .staging:
            return "https://api.iextrading.com/1.0/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configure") }
        return url
    }
    
    var path: String {
        switch self {
        case .allCurrentStocks():
            return "stock/market/list/infocus"
        case .getCompanyLogo(let symbols):
            return "stock/\(symbols)/quote"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .allCurrentStocks(), .getCompanyLogo(_):
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
