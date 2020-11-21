//
//  User.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import Foundation
import FirebaseFirestoreSwift

// MARK: - UserInfoElement
struct UserInfoElement: Codable {
  let uid, nickName, mbtiType: AccountType
  let age: Int
  let registerDate: Date
  let accountType: AccountType
  let accountEmail: MBTI
}

// MARK: UserInfoElement convenience initializers and mutators

extension UserInfoElement {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(UserInfoElement.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func with(
    uid: AccountType? = nil,
    nickName: AccountType? = nil,
    mbtiType: AccountType? = nil,
    age: Int? = nil,
    registerDate: Date? = nil,
    accountType: AccountType? = nil,
    accountEmail: MBTI? = nil
  ) -> UserInfoElement {
    return UserInfoElement(
      uid: uid ?? self.uid,
      nickName: nickName ?? self.nickName,
      mbtiType: mbtiType ?? self.mbtiType,
      age: age ?? self.age,
      registerDate: registerDate ?? self.registerDate,
      accountType: accountType ?? self.accountType,
      accountEmail: accountEmail ?? self.accountEmail
    )
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

enum MBTI: String, Codable {
  case ISTJ = "ISTJ"
  case ISFJ = "ISFJ"
  case INFJ = "INFJ"
  case INTJ = "INTJ"
  case ISTP = "ISTP"
  case ISFP = "ISFP"
  case INFP = "INFP"
  case INTP = "INTP"
  case ESTP = "ESTP"
  case ESFP = "ESFP"
  case ENFP = "ENFP"
  case ENTP = "ENTP"
  case ESTJ = "ESTJ"
  case ESFJ = "ESFJ"
  case ENFJ = "ENFJ"
  case ENTJ = "ENTJ"
}

enum AccountType: String, Codable {
  case kakao = "kakao"
  case apple = "apple"
}

typealias UserInfo = [UserInfoElement]

extension Array where Element == UserInfo.Element {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(UserInfo.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
  let decoder = JSONDecoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    decoder.dateDecodingStrategy = .iso8601
  }
  return decoder
}

func newJSONEncoder() -> JSONEncoder {
  let encoder = JSONEncoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    encoder.dateEncodingStrategy = .iso8601
  }
  return encoder
}
