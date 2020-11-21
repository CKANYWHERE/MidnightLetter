//
//  ServiceProvider.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxOptional

class BaseService {
  unowned let provider: ServiceProviderType

  init(provider: ServiceProviderType) {
    self.provider = provider
  }
}

protocol ServiceProviderType: class {
    var authenticationService: AuthenticationServiceType { get }
}

final class ServiceProvider: ServiceProviderType {
    lazy var authenticationService: AuthenticationServiceType = AuthenticationService(provider: self)
  
}


