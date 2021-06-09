//
//  Extensions.swift
//  Lay
//
//  Created by ericliuhusky on 2021/6/9.
//


// MARK: - Foundation

import Foundation

extension Array: Lay {}
extension Dictionary: Lay {}
extension Set: Lay {}



// MARK: - UIKit || APPKit

import ObjectiveC

// The components of UIKit and Appkit (eg: UIView, NSView) are all inherited from NSObject
extension NSObject: Lay {}


import CoreGraphics.CGGeometry

extension CGPoint: Lay {}
extension CGRect: Lay {}
extension CGSize: Lay {}
extension CGVector: Lay {}



// MARK: - UIKit

#if os(iOS) || os(tvOS)
import UIKit.UIGeometry

extension UIEdgeInsets: Lay {}
extension UIOffset: Lay {}
extension UIRectEdge: Lay {}
#endif



// MARK: - SwiftUI

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    typealias lay = () -> Self
}
#endif
