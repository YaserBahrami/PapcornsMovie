//
//  PapcornsNetworkProvider.swift
//  PapcornsMovie
//
//  Created by yaser on 1/22/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import Foundation
import Moya

enum PapcornsNetworkProvider{
    case GetSocialData
    case GetMovieData
}

extension PapcornsNetworkProvider: TargetType{
    var baseURL: URL {
        return URL(string:"http://www.mocky.io/v2/")!
    }
    
    var path: String {
        switch self{
        case .GetSocialData:
            return "5dea8bf6300000d23f2b09d0"
        case .GetMovieData:
            return "5dea8d843000001d442b09da"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .GetSocialData:
            return .get
        case .GetMovieData:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .GetSocialData:
            return .requestPlain
        case .GetMovieData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
    
    
}
