# SwizzleSwift
Swift swizzle made simple

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
