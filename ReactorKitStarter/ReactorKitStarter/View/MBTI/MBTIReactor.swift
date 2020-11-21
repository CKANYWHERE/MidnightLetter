//
//  MBTIReactor.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import RxSwift
import RxCocoa
import RxOptional
import ReactorKit

class MBTIReactor: Reactor {
  enum Action {
  }
  
  enum Mutation {
  }
  
  struct State {
    
  }
  
  let provider: ServiceProviderType
  let initialState: State
  var disposeBag = DisposeBag()
  
  init(provider: ServiceProviderType) {
    self.initialState = State()
    self.provider = provider
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
    }
  
}
