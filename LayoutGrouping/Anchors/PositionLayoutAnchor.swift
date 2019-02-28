//
//  PositionLayoutAnchor.swift
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
 An object that has layout anchors representing the various edges, and center.
 For example a `UIView` or `UILayoutGuide` instance.
 */
public protocol PositionableLayoutItem {
    /// Layout anchor representing the leading edge
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    /// Layout anchor representing the trailing edge
    var trailingAnchor: NSLayoutXAxisAnchor { get }

    /// Layout anchor representing the left edge
    var leftAnchor: NSLayoutXAxisAnchor { get }
    /// Layout anchor representing the right edge
    var rightAnchor: NSLayoutXAxisAnchor { get }

    /// Layout anchor representing the top edge
    var topAnchor: NSLayoutYAxisAnchor { get }
    /// Layout anchor representing the bottom edge
    var bottomAnchor: NSLayoutYAxisAnchor { get }

    /// Layout anchor representing the horizontal center
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    /// Layout anchor representing the vertical center
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: PositionableLayoutItem {}
extension UILayoutGuide: PositionableLayoutItem {}

/**
 Represents a combination of NSLayoutXAxisAnchor and NSLayoutYAxisAnchor layout anchors.
 This is used to create constraints equal to (and relatively equal to) both axes simultaneously.
 */
public struct PositionLayoutAnchor {
    public var horizontal: NSLayoutXAxisAnchor
    public var vertical: NSLayoutYAxisAnchor

    /**
     Returns two constraints that defines the anchor’s x and y axes as being equal to the
     specified anchor's x and y axes, with the addition of the constant.

     - Parameter anchor: The anchor to have equal x and y axes
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(equalTo anchor: PositionLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            horizontal.constraint(equalTo: anchor.horizontal, constant: constant.horizontal),
            vertical.constraint(equalTo: anchor.vertical, constant: constant.vertical)
        ]
    }

    /**
     Returns two constraints that defines the anchor’s x and y axes as being
     greater than or equal to the specified anchor's x and y axes, with the addition of the constant.

     - Parameter anchor: The anchor to have less than, or equal x and y axes
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(greaterThanOrEqualTo anchor: PositionLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            horizontal.constraint(greaterThanOrEqualTo: anchor.horizontal, constant: constant.horizontal),
            vertical.constraint(greaterThanOrEqualTo: anchor.vertical, constant: constant.vertical)
        ]
    }

    /**
     Returns two constraints that defines the anchor’s x and y axes as being less than or equal to the
     specified anchor's x and y axes, with the addition of the constant.

     - Parameter anchor: The anchor to have greater than, or equal x and y axes
     - Parameter constant: Offset to apply to the anchor you are calling (not the parameter)
     */
    public func constraints(lessThanOrEqualTo anchor: PositionLayoutAnchor,
                            constant: UIOffset = .zero) -> [NSLayoutConstraint] {
        return [
            horizontal.constraint(lessThanOrEqualTo: anchor.horizontal, constant: constant.horizontal),
            vertical.constraint(lessThanOrEqualTo: anchor.vertical, constant: constant.vertical)
        ]
    }
}

public extension PositionableLayoutItem {
    /// Layout anchor representing both the top and left anchors of this object
    public var topLeftAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leftAnchor, vertical: topAnchor)
    }

    /// Layout anchor representing both the top and right anchors of this object
    public var topRightAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: rightAnchor, vertical: topAnchor)
    }

    /// Layout anchor representing both the top and leading anchors of this object
    public var topLeadingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leadingAnchor, vertical: topAnchor)
    }

    /// Layout anchor representing both the top and trailing anchors of this object
    public var topTrailingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: trailingAnchor, vertical: topAnchor)
    }

    /// Layout anchor representing both the top and horizontal center anchors of this object
    public var topCenterXAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: centerXAnchor, vertical: topAnchor)
    }

    /// Layout anchor representing both the bottom and left anchors of this object
    public var bottomLeftAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leftAnchor, vertical: bottomAnchor)
    }

    /// Layout anchor representing both the bottom and right anchors of this object
    public var bottomRightAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: rightAnchor, vertical: bottomAnchor)
    }

    /// Layout anchor representing both the bottom and leading anchors of this object
    public var bottomLeadingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leadingAnchor, vertical: bottomAnchor)
    }

    /// Layout anchor representing both the bottom and trailing anchors of this object
    public var bottomTrailingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: trailingAnchor, vertical: bottomAnchor)
    }

    /// Layout anchor representing both the bottom and horiziontal center anchors of this object
    public var bottomCenterXAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: centerXAnchor, vertical: bottomAnchor)
    }

    /// Layout anchor representing both the vertical center and left anchors of this object
    public var centerYLeftAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leftAnchor, vertical: centerYAnchor)
    }

    /// Layout anchor representing both the vertical center and right anchors of this object
    public var centerYRightAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: rightAnchor, vertical: centerYAnchor)
    }

    /// Layout anchor representing both the vertical center and leading anchors of this object
    public var centerYLeadingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: leadingAnchor, vertical: centerYAnchor)
    }

    /// Layout anchor representing both the vertical center and trailing anchors of this object
    public var centerYTrailingAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: trailingAnchor, vertical: centerYAnchor)
    }

    /// Layout anchor representing both the vertical center and horizontal center anchors of this object
    public var centerYCenterXAnchor: PositionLayoutAnchor {
        return PositionLayoutAnchor(horizontal: centerXAnchor, vertical: centerYAnchor)
    }
}
