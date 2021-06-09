import XCTest
@testable import Lay

#if os(iOS) || os(tvOS)
import UIKit
typealias UNView = UIView
#else
typealias UNView = NSView
#endif

#if canImport(SwiftUI)
import SwiftUI
#endif

final class LayTests: XCTestCase {
    
    var size: CGSize = .lay { size in
        size.width = 100
        size.height = 50
    }
    
    func testLayValue() {
        XCTAssertEqual(size, CGSize(width: 100, height: 50))
    }
    
    func testMoveValue() {
        size.move { size in
            size.width = 100
            size.height = 100
        }
        XCTAssertEqual(size, CGSize(width: 100, height: 100))
    }
    
    let view: UNView = .lay { view in
        view.frame = .init(x: 0, y: 0, width: 100, height: 50)
    }
    
    func testLayReference() {
        XCTAssertEqual(view.frame, UNView(frame: CGRect(x: 0, y: 0, width: 100, height: 50)).frame)
    }
    
    func testMoveReference() {
        view.move { view in
            view.frame = .init(x: 0, y: 0, width: 100, height: 100)
        }
        XCTAssertEqual(view.frame, UNView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)).frame)
    }
    
    func testLaySwiftUI() {
        if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *) {
            let text: Text.lay = {
                .init("hello")
                .foregroundColor(.red)
            }
            XCTAssertEqual(text(), Text("hello").foregroundColor(.red))
        }
    }
}
