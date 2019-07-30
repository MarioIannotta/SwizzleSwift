//
//  ViewController.swift
//  SwizzleSwiftDemo
//
//  Created by Mario on 26/07/2019.
//  Copyright © 2019 Mario Iannotta. All rights reserved.
//

import UIKit
import SwizzleSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
}

extension UIViewController {
    
    @objc static func swizzle() -> Void {
        Swizzle(ViewController.self) {
            #selector(viewDidLoad) ==> #selector(myViewDidLoad)
            #selector(viewWillAppear(_:)) ==> #selector(myViewWillAppear(_:))
        }
    }
    
    @objc private func myViewDidLoad() {
        print(#function)
        myViewDidLoad()
    }
    
    @objc private func myViewWillAppear(_ animated: Bool) {
        print(#function)
        myViewWillAppear(animated)
    }
    
}
