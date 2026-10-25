//
//  BoxLayoutAnchor.swift
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
 Represents an anchor that describles the complete layout of an object,
 using `NSLayoutYAxisAnchor`s for the top and bottom edges
 and `NSLayoutXAxisAnchor` for the leading and trailing edges.
 */
public struct BoxLayoutAnchor {
    /// Layout anchor representing the top edge
    public var top: NSLayoutYAxisAnchor
    /// Layout anchor representing the bottom edge
    public var bottom: NSLayoutYAxisAnchor

    /// Layout anchor representing the leading edge
    public var leading: NSLayoutXAxisAnchor
    /// Layout anchor representing the trailing edge
    public var trailing: NSLayoutXAxisAnchor

    /**
     The edges are used to let you specify exactly which edges are constrained.
     For example, you could easily constraint one layout item to another, except for the bottom edge
     */
    public struct Edges: OptionSet {
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        public let rawValue: UInt8

        public static let top =        Edges(rawValue: 1<<0)
        public static let bottom =     Edges(rawValue: 1<<1)
        public static let leading =    Edges(rawValue: 1<<2)
        public static let trailing =   Edges(rawValue: 1<<3)

        public static let all: Edges               = [.top, .bottom, .leading, .trailing]
        public static let allExceptTop: Edges      = Edges.all.subtracting(.top)
        public static let allExceptBottom: Edges   = Edges.all.subtracting(.bottom)
        public static let allExceptLeading: Edges  = Edges.all.subtracting(.leading)
        public static let allExceptTrailing: Edges = Edges.all.subtracting(.trailing)
    }

    /**
     Returns up to four constraints that defines the anchor’s layout being equal to the
     specified anchor's layout for the provided edges, with the addition of the inset.

     - Parameter anchor: The anchor to have equal layout to
     - Parameter edges: The edges to create constraints for
     - Parameter constant: Inset to apply
     */
    public func constraints(equalTo anchor: BoxLayoutAnchor,
                            edges: Edges = .all,
                            constant: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {

        var result: [NSLayoutConstraint] = []

        if edges.contains(.top) {
            result.append(top.constraint(equalTo: anchor.top, constant: constant.top))
        }

        if edges.contains(.bottom) {
            result.append(bottom.constraint(equalTo: anchor.bottom, constant: -constant.bottom))
        }

        if edges.contains(.leading) {
            result.append(leading.constraint(equalTo: anchor.leading, constant: constant.left))
        }

        if edges.contains(.trailing) {
            result.append(trailing.constraint(equalTo: anchor.trailing, constant: -constant.right))
        }

        return result
    }

    /**
     Returns up to four constraints that defines the anchor’s layout being outside of or equal to the
     specified anchor's layout for the provided edges, with the addition of the inset.

     - Parameter anchor: The anchor to be outside of or equal to
     - Parameter edges: The edges to create constraints for
     - Parameter constant: Inset to apply
     */
    public func constraints(outsideOfOrEqualTo anchor: BoxLayoutAnchor,
                            edges: Edges = .all,
                            constant: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        var result: [NSLayoutConstraint] = []

        if edges.contains(.top) {
            result.append(top.constraint(lessThanOrEqualTo: anchor.top, constant: constant.top))
        }

        if edges.contains(.bottom) {
            result.append(bottom.constraint(greaterThanOrEqualTo: anchor.bottom, constant: -constant.bottom))
        }

        if edges.contains(.leading) {
            result.append(leading.constraint(lessThanOrEqualTo: anchor.leading, constant: constant.left))
        }

        if edges.contains(.trailing) {
            result.append(trailing.constraint(greaterThanOrEqualTo: anchor.trailing, constant: -constant.right))
        }

        return result
    }

    /**
     Returns up to four constraints that defines the anchor’s layout being inside of of or equal to the
     specified anchor's layout for the provided edges, with the addition of the inset.

     - Parameter anchor: The anchor to be outside of or equal to
     - Parameter edges: The edges to create constraints for
     - Parameter constant: Inset to apply
     */
    public func constraints(insideOfOrEqualTo anchor: BoxLayoutAnchor,
                            edges: Edges = .all,
                            constant: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        var result: [NSLayoutConstraint] = []

        if edges.contains(.top) {
            result.append(top.constraint(greaterThanOrEqualTo: anchor.top, constant: constant.top))
        }

        if edges.contains(.bottom) {
            result.append(bottom.constraint(lessThanOrEqualTo: anchor.bottom, constant: -constant.bottom))
        }

        if edges.contains(.leading) {
            result.append(leading.constraint(greaterThanOrEqualTo: anchor.leading, constant: constant.left))
        }

        if edges.contains(.trailing) {
            result.append(trailing.constraint(lessThanOrEqualTo: anchor.trailing, constant: -constant.right))
        }

        return result
    }
}

public extension PositionableLayoutItem {
    /// Layout anchor representing the top, bottom, leading, and trailing anchors
    public var boxAnchor: BoxLayoutAnchor {
        return BoxLayoutAnchor(top: topAnchor,
                               bottom: bottomAnchor,
                               leading: leadingAnchor,
                               trailing: trailingAnchor)
    }
}
