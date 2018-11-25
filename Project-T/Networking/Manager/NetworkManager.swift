//
//  NetworkManager.swift
//  Project T
//
//  Created by Игорь Талов on 25/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noInternetConnection = "no internet connection"
    case networkFailure
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment: NetworkingEnvironment = .production
    let router = Router<StocksApi>()
    
    func getAllStocks(completion: @escaping (_ stocks: [TinkoffStock]?, _ error: String?) -> ()) {
        router.request(.allCurrentStocks()) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription ?? "")
                completion(nil, NetworkResponse.noInternetConnection.rawValue)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)

                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([TinkoffStock].self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailure):
                    completion(nil, networkFailure)
                }

            }
        }
    }
 
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
