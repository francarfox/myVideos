//
//  VideoViewController.swift
//  myVideos
//
//  Created by francarfox on 8/1/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    var item: CarouselItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleClose))
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }

}
