//
//  MainTabBarViewController.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    selectedIndex = 4
    
        let vc1 = UINavigationController(rootViewController: BasketViewController())
        let vc2 = UINavigationController(rootViewController: MyAccountViewController())
        let vc3 = UINavigationController(rootViewController: SectionsViewController())
        let vc4 = UINavigationController(rootViewController: OffersViewController())
        let vc5 = UINavigationController(rootViewController: HomeViewController())
 
    
        vc1.tabBarItem.image = UIImage(systemName: "cart")
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc3.tabBarItem.image = UIImage(systemName: "circle.grid.cross")
        vc4.tabBarItem.image = UIImage(systemName: "bag")
        vc5.tabBarItem.image = UIImage(systemName: "house")

        vc1.title = "السلة"
        vc2.title = "حسابي"
        vc3.title = "الأقسام"
        vc4.title = "العروض"
        vc5.title = "الرئيسة"
    
        tabBar.tintColor  = UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0)

        setViewControllers([vc1,vc2,vc3,vc4, vc5], animated: false)
        
    }


}

