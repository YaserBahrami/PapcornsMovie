//
//  SocialViewController.swift
//  PapcornsMovie
//
//  Created by yaser on 1/23/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {

    @IBOutlet weak var socialTableView: UITableView!
    var socialPostData: [DSocial] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.socialTableView.register(SocialPostTableViewCell.self)
        PapcornsAPIService.shared.getSocialPosts { (result) in
                   switch result{
                   case .success(let model):
                       self.socialPostData = model
                       self.socialTableView.reloadData()
                   //reload!
                   case .failure(let error):
                       print("\(error)")
                   }
               }
        
        // Do any additional setup after loading the view.
    }
    

}

extension SocialViewController: UITableViewDelegate{
    
}
extension SocialViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        socialPostData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = socialTableView.dequeueReusableCell(indexPath: indexPath) as SocialPostTableViewCell
        
        cell.socialData = socialPostData[indexPath.row]
        cell.setupView()
        return cell
    }
    
    
}

