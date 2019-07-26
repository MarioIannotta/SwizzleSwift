//
//  SwizzleSwift.swift
//  SwizzleSwiftDemo
//
//  Created by Mario on 26/07/2019.
//  Copyright © 2019 Mario Iannotta. All rights reserved.
//

import Foundation

public struct Swizzle {
    
    public typealias SwizzleClosure = (original: Selector, swizzled: Selector)
    
    private var type: AnyObject.Type
    
    @discardableResult
    public init(_ type: AnyObject.Type, _ configurationClosures: (() -> (SwizzleClosure))...) {
        self.type = type
        configurationClosures.forEach {
            let configurationClosure = $0()
            swizzle(original: configurationClosure.original,
                    swizzled: configurationClosure.swizzled)
        }
    }
    
    private func swizzle(original: Selector, swizzled: Selector) {
        guard
            let originalMethod = class_getInstanceMethod(type, original),
            let swizzledMethod = class_getInstanceMethod(type, swizzled)
            else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
}
