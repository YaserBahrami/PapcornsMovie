//
//  SocialPostCollectionViewCell.swift
//  PapcornsMovie
//
//  Created by yaser on 1/23/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit

class SocialPostCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postMessageLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var CommentButton: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


protocol Reusable {}

extension Reusable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
