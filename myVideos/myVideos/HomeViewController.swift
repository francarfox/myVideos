//
//  HomeViewController.swift
//  carouselTest
//
//  Created by francarfox on 7/21/17.
//  Copyright © 2017 francarfox. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    let tableCellId = "tableCellIdentifier"
    var carousels = [Carousel]()
    var statusBarHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: .zero)

        DataService.shared.loadData { [unowned self] (carousels: [Carousel]) in
            self.carousels = carousels
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return carousels.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath) as! CarouselViewCell

        cell.delegate = self
        cell.carousel = carousels[indexPath.section]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carousels[section].title
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .orange
        }
    }

}

extension HomeViewController: CarouselViewCellDelegate {
    func carouselViewCell(_ cell: CarouselViewCell, didSelectItem item: CarouselItem) {
        let videoLauncher = VideoLauncher()
//        controller.item = item
        
        videoLauncher.showVideoPlayer {
            self.statusBarHidden = !self.statusBarHidden
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }
}
