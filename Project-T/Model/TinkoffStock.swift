//
//  Stock.swift
//  Project T
//
//  Created by Игорь Талов on 24/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import Foundation

struct TinkoffStock: Codable {
    let symbol: String
    let companyName: String
    let primaryExchange: String
    let calculationPrice: String
    let open: Double
    let openTime: Int
    let close: Double
    let closeTime: Int
    let high: Double
    let low: Double
    let latestPrice: Double
    let latestSource: String
    let latestTime: String
    let latestUpdate: Int
    let latestVolume: Int
//    let iexRealtimePrice: Double?
//    let iexRealtimeSize: Int?
//    let iexLastUpdated: Int?
//    let delayedPrice: Double?
//    let delayedPriceTime: Int
//    let extendedPrice: Double
//    let extendedChange: Double
//    let extendedChangePercent: Double
//    let extendedPriceTime: Int
//    let previousClose: Double
//    let change: Double
//    let changePercent: Double
//    let iexMarketPercent: Double?
//    let iexVolume: Int?
//    let avgTotalVolume: Int?
//    let iexBidPrice: Double?
//    let iexBidSize: Int
//    let iexAskPrice: Double?
//    let iexAskSize: Int?
//    let marketCap: Int
//    let peRatio: Double
//    let week52High: Double
//    let week52Low: Double
//    let ytdChange: Double
}
