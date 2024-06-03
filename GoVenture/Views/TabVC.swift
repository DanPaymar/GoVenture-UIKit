//
//  TabVC.swift
//  GoVenture
//
//  Created by Daniel Paymar on 6/3/24.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUptabs()
        
        // set the tabbar styles
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .green
        self.tabBar.barTintColor = .systemGray
        self.tabBar.unselectedItemTintColor = .brown
    }
    
    // MARK: - Tab bar setup
    private func setUptabs() {
        let home = createNav(with: "Map", and: UIImage(systemName: "map"), vc: MapVC())
        let myMaps = createNav(with: "My Maps", and: UIImage(systemName: "star"), vc: MyMapsVC())
        let gear = createNav(with: "Gear", and: UIImage(systemName: "backpack"), vc: GearVC())
        
        self.setViewControllers([home, myMaps, gear], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + "Control"
        // top bar item
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
        
        return nav
    }
}
