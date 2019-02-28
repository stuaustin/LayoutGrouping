//
//  SizeLayoutAnchor.swift
//  LayoutGrouping
//
//  Created by Stuart Austin on 26/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
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
