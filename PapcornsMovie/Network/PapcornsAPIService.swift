//
//  PapcornsAPIService.swift
//  PapcornsMovie
//
//  Created by yaser on 1/22/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum Result<T> {
    case success(value: T)
    case failure(error: String)
}

class PapcornsAPIService{
    static let shared = PapcornsAPIService()
    let provider = MoyaProvider<PapcornsNetworkProvider>()
    
    func getSocialPosts(callBack: @escaping (Result<[DSocial]>) -> Void){
        provider.request(.GetSocialData) { result in
            switch result{
            case .success(let moyaResponse):
                let data = moyaResponse.data
                let jsonObj = JSON(data)
                var model = [DSocial()]
                model.removeAll()
                
                if jsonObj.count > 0{
                    for index in 0...(jsonObj.count-1){
                        model.append(DSocial(json: jsonObj[index]))
                    }
                }
                
                callBack(Result.success(value: model))
                
            case .failure(let error):
                callBack(Result.failure(error: error.errorDescription!))
            }
        }
    }
    
    func getMovieList(callBack: @escaping (Result<[DMovie]>) -> Void){
        provider.request(.GetSocialData) { result in
            switch result{
            case .success(let moyaResponse):
                let data = moyaResponse.data
                let jsonObj = JSON(data)
                var model = [DMovie()]
                model.removeAll()
                
                if jsonObj.count > 0{
                    for index in 0...(jsonObj.count-1){
                        model.append(DMovie(json: jsonObj[index]))
                    }
                }
                
                callBack(Result.success(value: model))
                
            case .failure(let error):
                callBack(Result.failure(error: error.errorDescription!))
            }
        }
    }
    
}
