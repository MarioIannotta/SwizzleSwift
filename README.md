# SwizzleSwift
Who said that method swizzling needs to look ugly? SwizzleSwift is a little wrapper that lets you swizzle selectors just one clean and elegant API. 

![SwizzleSwift: Swizzle selectors with just one clean and elegant API](https://raw.githubusercontent.com/MarioIannotta/SwizzleSwift/master/SwizzleSwift.png)

[![Version](https://img.shields.io/cocoapods/v/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)
[![License](https://img.shields.io/cocoapods/l/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)
[![Platform](https://img.shields.io/cocoapods/p/SwizzleSwift.svg?style=flat)](https://cocoapods.org/pods/SwizzleSwift)

## Installation

### Pods
> pod 'SwizzleSwift'
### Swift package manager
> From Xcode, select File → Swift Packages → Add Package Dependency → Select your project → Search **SwizzleSwift**

# Usage example

```swift
Swizzle(<#AType.Self#>) {
	<#OriginalSelector#> ==> <#SwizzledSelector#>
}

```

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
        Swizzle(ViewController.self) {
            #selector(viewDidLoad) ==> #selector(myViewDidLoad)
            #selector(viewWillAppear(_:)) ==> #selector(myViewWillAppear(_:))
        }
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
