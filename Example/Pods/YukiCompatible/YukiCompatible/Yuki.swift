//
//  Yuki.swift
//  Pods-YukiCompatible_Example
//
//  Created by Simple on 2021/4/29.
//

import Foundation

public struct Yuki<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
    public var build: Base {
        return base
    }
}

public protocol YukiCompatible {
    associatedtype CompatibleType
    var YK: CompatibleType { get }
}
extension YukiCompatible {
    public var YK: Yuki<Self> {
        return Yuki(self)
    }
}

extension NSObject: YukiCompatible {}
