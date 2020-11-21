//
//  AppDelegate.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import UIKit
import Then
import SnapKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    FirebaseApp.configure()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
//    let serviceProvider = ServiceProvider()
//    let viewController = ViewController()
//    viewController.view.backgroundColor = .white
//    viewController.reactor = BasicReactor(provider: serviceProvider)
//    let navigationController = UINavigationController(rootViewController: viewController)
    

    window?.rootViewController = TabBarController()
    window?.makeKeyAndVisible()
    
    return true
  }

}

