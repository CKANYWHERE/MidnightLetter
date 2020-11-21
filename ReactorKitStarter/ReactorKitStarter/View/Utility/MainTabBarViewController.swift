//
//  MainTabBarViewController.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.viewControllers = [mainTabBar, mbtiTabBar, settingTabBar]
  }
  
  lazy public var mainTabBar: UINavigationController = {
    
    let mainVC = MainViewController()
    let naviVC = UINavigationController(rootViewController: mainVC)
    let title = "Main"
    
    let tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
    
    naviVC.tabBarItem = tabBarItem
    mainVC.reactor = MainReactor(provider: ServiceProvider())
    
    return naviVC
  }()
  
  lazy public var mbtiTabBar: UINavigationController = {
    
    let mainVC = MBTIViewController()
    let naviVC = UINavigationController(rootViewController: mainVC)
    let title = "MBTI"
    
    let tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
    
    naviVC.tabBarItem = tabBarItem
    mainVC.reactor = MBTIReactor(provider: ServiceProvider())
    
    
    return naviVC
  }()
  
  lazy public var settingTabBar: UINavigationController = {
    
    let mainVC = SettingViewController()
    let naviVC = UINavigationController(rootViewController: mainVC)
    let title = "Setting"
    
    let tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
    
    naviVC.tabBarItem = tabBarItem
    mainVC.reactor = SettingReactor(provider: ServiceProvider())
    
    return naviVC
  }()
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

extension TabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title!)")
  }
}

