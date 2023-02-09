//
//  MainViewController.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 02.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .systemGray6
        setupTabBar()
    }

    private func setupTabBar() {

        let mostEmailedViewController = createNavigationController(vc: ArticlesListViewController(articlesCategory: .mostEmailed),
                                                                   name: "Most Emailed",
                                                                   image: "envelope.circle.fill")
        let mostSharedViewController = createNavigationController(vc: ArticlesListViewController(articlesCategory: .mostShared),
                                                                  name: "Most Shared",
                                                                  image: "rectangle.stack.fill.badge.person.crop")
        let mostViewedViewController = createNavigationController(vc: ArticlesListViewController(articlesCategory: .mostViewed),
                                                                  name: "Most Viewed",
                                                                  image: "doc.text.viewfinder")
        let favoritesViewController = createNavigationController(vc: FavoritesListViewController(),
                                                                 name: "Favorites",
                                                                 image: "star")

        viewControllers = [mostEmailedViewController, mostSharedViewController, mostViewedViewController, favoritesViewController]
    }
    
    private func createNavigationController(vc: UIViewController, name: String, image: String) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: vc)
        vc.title = name
        let tabBarItem = UITabBarItem(title: name, image: UIImage(systemName: image), tag: 0)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}

