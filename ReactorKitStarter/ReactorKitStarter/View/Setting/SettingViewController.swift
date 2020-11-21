//
//  SettingViewController.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxViewController
import RxOptional
import ReactorKit

class SettingViewController: UIViewController, ReactorKit.View {
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupUI()
  }
  
  func bind(reactor: SettingReactor) {
      
  }
  
  func setupUI() {
    setupConstraints()
  }
  
  func setupConstraints() {
  }

}

