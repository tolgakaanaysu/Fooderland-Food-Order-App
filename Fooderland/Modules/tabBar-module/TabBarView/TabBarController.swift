//
//  TabBarController.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 13.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var presenter: TabBarPresenterProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    private func navigationBarApperanceConfigure(){
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .systemIndigo
        
        
//        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationBarAppearance.titleTextAttributes = titleAttribute as [NSAttributedString.Key : Any]
        
        //        tabBar.tintColor = .white
        //        tabBar.standardAppearance = navigationBarAppearance
        //        tabBar.scrollEdgeAppearance = navigationBarAppearance
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        //        UINavigationBar.appearance().tintColor = .white
        
    }
    
    private func createNewTabBarItem(target viewController: UIViewController,
                                     title: String? = nil,
                                     image: String,
                                     selectedImage: String)
    -> UIViewController {
        viewController.title = title
        viewController.tabBarItem.image = UIImage(systemName: image)
        viewController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}

extension TabBarController: TabBarPresenterDelegate {
    func configureBarItem() {
        navigationBarApperanceConfigure()
    }
    
    func setupViewController() {
        let first = createNewTabBarItem(target: MenuBuilder.make(), title: "Menu",image: "star", selectedImage: "star.fill")
        let second = createNewTabBarItem(target: ShoppingCartBuilder.make(), title: "Cart", image: "heart", selectedImage: "heart.fill")
        viewControllers = [first,second]
    }
}
