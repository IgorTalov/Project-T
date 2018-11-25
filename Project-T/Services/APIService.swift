//
//  APIService.swift
//  Project T
//
//  Created by Игорь Талов on 24/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

public typealias ThrowsResultClosure<T> = () throws -> (T)
public typealias ThrowsCompletion<T> = (@escaping ThrowsResultClosure<T>) -> Void

protocol APIServiceProtocol: class {
    func getAllStocks(completion: @escaping ThrowsCompletion<[Stock]>)
}

class APIService: APIServiceProtocol {
    func getAllStocks(completion: @escaping ThrowsCompletion<[Stock]>) {
        
    }
    
    
}
