//
//  Carousel.swift
//  carouselTest
//
//  Created by francarfox on 7/21/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit
import Gloss

class Carousel: Decodable {
    var title: String?
    var type: CarouselType?
    var items: [CarouselItem]?
    
    required init?(json: JSON) {
        title = "title" <~~ json
        type = "type" <~~ json
        items = "items" <~~ json
    }
}

enum CarouselType: String {
    case thumb
    case poster
}

class CarouselItem: Decodable {
    var id: String
    var title: String?
    var url: String?
    
    required init?(json: JSON) {
        id = UUID().uuidString
        title = "title" <~~ json
        url = "url" <~~ json
    }
}
