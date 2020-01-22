//
//  DMovie.swift
//  PapcornsMovie
//
//  Created by yaser on 1/22/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit
import SwiftyJSON

class DMovie: NSObject {
    var id: Int!
    var movieImage: String!
    var movieTitle: String!
    var movieYear: Int!
    var movieGenre: String!
    var isPopular: Bool!
    var isRecommended: Bool!
    
    public override init(){
        
    }
    
    
    init (json: JSON) {
        id = json["id"].intValue
        movieImage = json["movieImage"].stringValue
        movieTitle = json["movieTitle"].stringValue
        movieYear = json["movieYear"].intValue
        movieGenre = json["movieGenre"].stringValue
        isPopular = json["isPopular"].boolValue
        isRecommended = json["isRecommended"].boolValue
    }
}
