# Lay

[![SPM](https://img.shields.io/badge/SPM-supported-orange)](https://swift.org/package-manager/)
[![License](https://img.shields.io/github/license/ericliuhusky/Lay)](https://github.com/ericliuhusky/Lay/blob/main/LICENSE)

### **Lay** is a syntactic sugar of Swift initializers, to make code form of initializers more elegant and structured.

    The mother Swift laid an egg once upon a time, and the egg will incubate into a Swift one day. 
    We call the process that initialize a Swift initialization. 

    Since that when you want to initialize a Swift type, you call the lay function.

## Usage

- ### Main Usage

    Make initializers more elegent.

    ```swift
    let label: UILabel = .lay { label in
        label.textColor = .red
        label.text = "Hello, Lay!"
    }
    ```

    Simplified meaningless code `let label = UILabel()`, `return label` and `()`.

    It's annoyed to type a pair of brackets everytime when initialize a view and set it's properties.

- ### Required Init Param

    There's always a situation that an initializer requires parameters. (eg: UICollectionView)

    ```swift
    let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init()).move { collectionView in

    }
    ```

- ### Initialize

    ```swift
    let instance: SomeType = .lay { instance in
        // set instance's properties
    } 
    ```

    SomeType: [ `Array`, `Dictionary`, `Set`, `NSObject`, `UIView`, `UILabel`, `UIImageView`, `CGPoint`, `CGRect`, `CGSize`, `CGVector`, `UIEdgeInsets`, `UIOffset`, `UIRectEdge` ]

- ### Change Value

    ```swift
    instance.move { instance in
        // change value of instance's properties
    }
    ```

- ### Custom Type

    All you need to do is to make your type confirm Lay protocol.

    For a class type you need to add `required init() {}`

    ```swift
    class CustomType {
        required init() {}
    }

    extension CustomType: Lay {}
    ```

    Actually a struct type has a default initializer

    ```swift
    struct CustomType {

    }

    extension CustomType: Lay {}
    ```

- ### SwiftUI

    ```swift
    struct ContentView: View {
        
        var body: some View {
            text()
        }

        var text: Text.lay = {
            .init("Hello, Lay!")
            .foregroundColor(.red)
        }
    }
    ```

## Installation

- ### Swift Package Manager

    ```swift
    dependencies: [
        .package(url: "https://github.com/ericliuhusky/Lay.git", .upToNextMajor(from: "0.1.1"))         
    ]

    targets: [
        .target(name: "", dependencies: ["Lay"])
    ]
    ```

## License

Lay is released under the MIT license. [See LICENSE](./LICENSE) for details.
