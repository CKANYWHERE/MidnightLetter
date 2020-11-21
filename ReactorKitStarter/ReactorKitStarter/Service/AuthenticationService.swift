//
//  AuthenticationService.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxOptional
import Firebase
import FirebaseFirestoreSwift

enum FirestoreError: Error {
  case error
}

protocol AuthenticationServiceType {
  var disposeBag: DisposeBag { get set }
  
  func signUp(userInfo: UserInfoElement) -> Observable<Bool>
}

extension AuthenticationServiceType {
  var disposeBag: DisposeBag {
    return DisposeBag()
  }
}

final class AuthenticationService: BaseService, AuthenticationServiceType {

  var disposeBag: DisposeBag = DisposeBag()
  
  private let db = Firestore.firestore()
  
  func signUp(userInfo: UserInfoElement) -> Observable<Bool> {
    return Observable.create { (observer) -> Disposable in
      var ref: DocumentReference? = nil
      
      do {
        ref = try self.db.collection("User").addDocument(from: userInfo) { error in
          if error != nil {
            print(error)
            observer.onError(FirestoreError.error)
          } else {
            print("success")
            observer.onNext(true)
          }
        }
      } catch {
        print(error)
      }
      return Disposables.create()
    }
  }
}
