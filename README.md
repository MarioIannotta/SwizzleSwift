# SwizzleSwift
Who said that method swizzling needs to look ugly? SwizzleSwift is a little wrapper that lets you swizzle selectors with one simple API. 

[![Version](https://img.shields.io/cocoapods/v/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)
[![License](https://img.shields.io/cocoapods/l/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)
[![Platform](https://img.shields.io/cocoapods/p/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)

# Usage example

Given the following controller
```swift
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

    @objc private func myViewDidLoad() {
        print(#function)
        myViewDidLoad()
    }
    
    @objc private func myViewWillAppear(_ animated: Bool) {
        print(#function)
        myViewWillAppear(animated)
    }
    
}
```

Swizzling the methods like this
```swift
extension UIViewController {

    @objc static func methodSwizzling() -> Void {
        Swizzle(ViewController.self,
                { (original: #selector(viewDidLoad), swizzled: #selector(myViewDidLoad)) },
                { (#selector(viewWillAppear(_:)), #selector(myViewWillAppear(_:))) }) // you can also omit the labels "original" and "swizzled"
    }
    
}
```

Will produce the following output
```swift
myViewDidLoad()
viewDidLoad()
myViewWillAppear(_:)
viewWillAppear(_:)
```

## Installation

SwizzleSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwizzleSwift'
```
