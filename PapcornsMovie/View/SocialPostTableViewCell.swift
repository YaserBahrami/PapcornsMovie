//
//  SocialPostCollectionViewCell.swift
//  PapcornsMovie
//
//  Created by yaser on 1/23/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit

class SocialPostTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postMessageLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var CommentButton: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    
    var socialData: DSocial!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(){
        userNameLabel.text = socialData.userFullName
        postDateLabel.text = socialData.createdAt
        postMessageLabel.text = socialData.postMessage
        userImage.downloaded(from: socialData.userImageUrl)
        LikeButton.titleLabel?.text = "\(socialData.likeCount!)"
        CommentButton.titleLabel?.text = "\(socialData.commentCount!)"
        if socialData.postImage == nil{
            if postImage != nil{
                postImage.removeFromSuperview()
            }
        }
        postImage.downloaded(from: socialData.postImage)
    }
    
    
}


protocol Reusable {}

extension Reusable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
