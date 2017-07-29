//
//  DataService.swift
//  carouselTest
//
//  Created by francarfox on 7/21/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit
import Gloss

private let imageCache = NSCache<NSString, UIImage>()

class DataService {

    static var shared = DataService()
    
    private init() { }

    func loadData(completion: @escaping ([Carousel])->()) {
        
        if let path = Bundle.main.path(forResource: "jsonFile", ofType: "json"),
            let jsonData = NSData(contentsOfFile: path) as? Data {
            
            if let jsonResult = try? JSONSerialization.jsonObject(with: jsonData) as! NSDictionary {
                
                if let structJSON = jsonResult["struct"] as? [JSON] {
                    
                    if let array = [Carousel].from(jsonArray: structJSON) {
                        print("\(array)")
                        completion(array)
                        return
                    }
                }
                
            }
            
        }
        
        print("Error when loading data")
    }
    
    func loadImage(urlString: String, id: String, completion: @escaping (UIImage)->()) {
        
        if let cachedImage = imageCache.object(forKey: id as NSString) {
            completion(cachedImage)
            return
        }
        
        //request
        if let url = URL(string: urlString) {
            let session = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print("Error: \(error!)")
                    return
                }
                
                DispatchQueue.main.async {
                    if data != nil, let image = UIImage(data: data!) {
                        imageCache.setObject(image, forKey: id as NSString)
                        completion(image)
                    }
                }
            })
            session.resume()
        }
        
    }
    
}
