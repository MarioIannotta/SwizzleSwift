//
//  SwizzleSwift.swift
//  SizzleSwift
//
//  Created by Mario on 30/07/2019.
//  Copyright © 2019 Mario Iannotta. All rights reserved.
//

import Foundation

infix operator ==>

public struct SwizzlePair {
    let original: Selector
    let swizzled: Selector
}

extension Selector {
    
    public static func ==>(original: Selector, swizzled: Selector) -> SwizzlePair {
        SwizzlePair(original: original, swizzled: swizzled)
    }
    
}

public struct Swizzle {

    @_functionBuilder
    public struct SwizzleFunctionBuilder {
        
        public static func buildBlock(_ swizzlePairs: SwizzlePair...) -> [SwizzlePair] {
            Array(swizzlePairs)
        }
        
    }
    
    @discardableResult
    public init(_ type: AnyObject.Type, @SwizzleFunctionBuilder _ makeSwizzlePairs: () -> [SwizzlePair]) {
        let swizzlePairs = makeSwizzlePairs()
        swizzlePairs.forEach { swizzlePair in
            guard
                let originalMethod = class_getInstanceMethod(type, swizzlePair.original),
                let swizzledMethod = class_getInstanceMethod(type, swizzlePair.swizzled)
                else { return }
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
}
