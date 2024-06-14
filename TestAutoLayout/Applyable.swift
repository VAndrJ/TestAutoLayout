//
//  Applyable.swift
//  TestAutoLayout
//
//  Created by VAndrJ on 10.06.2024.
//

import Foundation

protocol Applyable {}

extension Applyable {

    @discardableResult
    func apply(_ f: (Self) throws -> Void) rethrows -> Self {
        try f(self)

        return self
    }
}

extension NSObject: Applyable {}
