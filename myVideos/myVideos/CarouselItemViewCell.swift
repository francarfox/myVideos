//
//  CarouselItemViewCell.swift
//  carouselTest
//
//  Created by francarfox on 7/21/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit

let posterImageUrl = "https://placeimg.com/320/480/any"
let thumbImageUrl = "https://placeimg.com/640/480/any"

class CarouselItemViewCell: UICollectionViewCell {
    
    var carouselType: CarouselType?
    
    var item: CarouselItem? {
        didSet {
            guard let carouselItem = item else { return }
            
            let imageUrl = (carouselType == .poster) ? posterImageUrl : thumbImageUrl
            
            backgroundImageView.image = nil
            DataService.shared.loadImage(urlString: imageUrl, id: carouselItem.id) { [unowned self] (image) in
                self.backgroundImageView.image = image
            }
            
            titleView.textColor = (carouselType == .poster) ? .white : .black
            titleView.text = carouselItem.title
            backgroundColor = .clear
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(backgroundImageView)
        addSubview(titleView)
        
        setupViews()
    }
    
    func setupViews() {
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        titleView.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width - 10).isActive = true
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleView: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 9)
        title.textColor = .black
        title.lineBreakMode = .byTruncatingTail
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
}
