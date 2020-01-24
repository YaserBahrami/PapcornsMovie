//
//  extentions.swift
//  PapcornsMovie
//
//  Created by yaser on 1/23/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import Foundation
import Alamofire


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_ type: T.Type) where T: Reusable {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable  {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ type: T.Type) where T: Reusable {
        let nib = UINib(nibName: type.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: type.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(at index: IndexPath) -> T where T: Reusable {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: index) as! T
    }
}
