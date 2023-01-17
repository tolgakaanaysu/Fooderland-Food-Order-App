//
//  TabBarBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import UIKit

final class TabBarBuilder {
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter        
        return view
    }
}
