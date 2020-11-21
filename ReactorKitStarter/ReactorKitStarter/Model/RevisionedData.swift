//
//  RevisionedData.swift
//  ReactorKitStarter
//
//  Created by 정의석 on 2020/11/21.
//

import Foundation

struct RevisionedData<T>: Equatable {
    static func == (lhs: RevisionedData, rhs: RevisionedData) -> Bool {
        lhs.revision == rhs.revision
    }
    
    
    fileprivate let revision: UInt
    let data: T?
}
