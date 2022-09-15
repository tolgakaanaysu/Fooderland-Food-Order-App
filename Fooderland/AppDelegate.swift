//
//  AppDelegate.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        navigationBarApperanceConfigure()
        
        FirebaseApp.configure()
        return true
    }

    func navigationBarApperanceConfigure(){
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.backgroundColor = .systemIndigo
        
        
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBarAppearance.titleTextAttributes = titleAttribute as [NSAttributedString.Key : Any]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().tintColor = .white
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

