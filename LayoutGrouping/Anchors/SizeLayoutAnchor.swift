//
//  SizeLayoutAnchor.swift
//
//  Copyright (c) 2019 Stuart Austin
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/**
 An object that has both a widthAnchor and heightAnchor available,
 for example a `UIView` or `UILayoutGuide` instance.
 */
public protocol SizeableLayoutItem {
    /// Layout anchor representing the width of the item
    var widthAnchor: NSLayoutDimension { get }

    /// Layout anchor representing the height of the item
    var heightAnchor: NSLayoutDimension { get }
}

extension UIView: SizeableLayoutItem {}
extension UILayoutGuide: SizeableLayoutItem {}

/**
 Represents two NSLayoutDimension objects,
 one being the dimensions for a width and one being the dimensions for a height.
 This is used to create constraints equal to (and relatively equal to) both dimensions simultaneously.
 */
public struct SizeLayoutAnchor {
    /// Width dimension
    public var width: NSLayoutDimension

    /// Height dimension
    public var height: NSLayoutDimension

    /**
     Returns two constraints that defines the anchor’s size as being equal to the specified anchor's size,
     with the addition of the constant.

     - Parameter anchor: The anchor to be of equal size
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(equalTo anchor: SizeLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            width.constraint(equalTo: anchor.width, constant: constant.horizontal),
            height.constraint(equalTo: anchor.height, constant: constant.vertical)
        ]
    }

    /**
     Returns two constraints that defines the anchor’s size as being greater than or
     equal to the specified anchor's size, with the addition of the constant.

     - Parameter anchor: The anchor to be of less than or equal size
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(greaterThanOrEqualTo anchor: SizeLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            width.constraint(greaterThanOrEqualTo: anchor.width, constant: constant.horizontal),
            height.constraint(greaterThanOrEqualTo: anchor.height, constant: constant.vertical)
        ]
    }

    /**
     Returns two constraints that defines the anchor’s size as being less than or
     equal to the specified anchor's size, with the addition of the constant.

     - Parameter anchor: The anchor to be of greater than or equal size
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(lessThanOrEqualTo anchor: SizeLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            width.constraint(lessThanOrEqualTo: anchor.width, constant: constant.horizontal),
            height.constraint(lessThanOrEqualTo: anchor.height, constant: constant.vertical)
        ]
    }
}

public extension SizeableLayoutItem {
    /// Layout anchor representing both the width and height of this object
    public var sizeAnchor: SizeLayoutAnchor {
        return SizeLayoutAnchor(width: widthAnchor, height: heightAnchor)
    }
}
