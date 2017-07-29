//
//  CarouselViewCell.swift
//  carouselTest
//
//  Created by francarfox on 7/21/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit

class CarouselViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let collectionCellId = "collectionCellIdentifier"
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    var carousel: Carousel? {
        didSet {
            //set size collection item
            collectionView?.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carousel?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath) as! CarouselItemViewCell
        
        if let item = carousel?.items?[indexPath.row] {
            cell.carouselType = carousel?.type
            cell.item = item
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (carousel?.type == .poster) ? 100 : 130
        
        return CGSize(width: width, height: frame.height)
    }

}
