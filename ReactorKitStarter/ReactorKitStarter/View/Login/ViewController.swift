//
//  ViewController.swift
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

class ViewController: UIViewController, ReactorKit.View {
  
  lazy var loginButton = UIButton().then {
    $0.setTitle("login", for: .normal)
    $0.backgroundColor = .orange
  }
  
  lazy var colorBox = UIView().then {
    $0.backgroundColor = .black
  }
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupUI()
  }
  
  func bind(reactor: BasicReactor) {
    
      
  }
  
  func setupUI() {
    view.addSubview(loginButton)
    view.addSubview(colorBox)
    setupConstraints()
  }
  
  func setupConstraints() {
    loginButton.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalTo(view).multipliedBy(0.7)
      $0.height.equalTo(60)
    }
    
    colorBox.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(40)
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(loginButton)
    }
  }

}

