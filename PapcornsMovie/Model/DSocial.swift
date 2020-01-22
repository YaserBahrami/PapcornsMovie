//
//  DSocial.swift
//  PapcornsMovie
//
//  Created by yaser on 1/22/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit
import SwiftyJSON

class DSocial: NSObject {
    var id: Int!
    var userFullName: String!
    var userImageUrl: String!
    var createdAt: String!
    var likeCount: Int!
    var commentCount: Int!
    var postImage: String!
    var postMessage: String!
    
    public override init(){
        
    }
    
    
    init (json: JSON) {
        id = json["id"].intValue
        userFullName = json["userFullName"].stringValue
        userImageUrl = json["userImageUrl"].stringValue
        createdAt = json["createdAt"].stringValue
        likeCount = json["likeCount"].intValue
        commentCount = json["commentCount"].intValue
        postImage = json["postImage"].stringValue
        postMessage = json["postMessage"].stringValue
    }
    
}
