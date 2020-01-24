//
//  MoviesViewController.swift
//  PapcornsMovie
//
//  Created by yaser on 1/23/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    var recommendedData: [DMovie] = []
    @IBOutlet weak var popularCollectionView: UICollectionView!
    var populardData: [DMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.recommendedCollectionView.register(MovieCollectionViewCell.self)
        self.popularCollectionView.register(MovieCollectionViewCell.self)
        
        
        recommendedCollectionView.layer.borderWidth = 1.0;
        
        recommendedCollectionView.layer.cornerRadius = 4.0;
        
        PapcornsAPIService.shared.getMovieList { (result) in
            switch result{
            case .success(let model):
                self.recommendedData.removeAll()
                self.populardData.removeAll()
                for item in model{
                    if item.isPopular{
                        self.populardData.append(item)
                    }
                    if item.isRecommended{
                        self.recommendedData.append(item)
                    }
                }
                print(self.recommendedData.count)
                print(self.populardData.count)
                self.recommendedCollectionView.reloadData()
                self.popularCollectionView.reloadData()
            //reload!
            case .failure(let error):
                print("\(error)")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension MoviesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recommendedCollectionView{
            return recommendedData.count
        }else{
            return populardData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recommendedCollectionView{
            let cell = recommendedCollectionView.dequeueReusableCell(at: indexPath) as MovieCollectionViewCell
            cell.movieData = recommendedData[indexPath.row]
            cell.setupView()
            
            return cell
        }else{
            let cell = popularCollectionView.dequeueReusableCell(at: indexPath) as MovieCollectionViewCell
            cell.movieData = populardData[indexPath.row]
            cell.setupView()
            
            return cell
        }
    }
    
    
}
extension MoviesViewController: UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.layer.bounds.width * 0.7, height: collectionView.layer.bounds.height)
        return CGSize(width: 200.0, height: collectionView.layer.bounds.height)
    }
}
