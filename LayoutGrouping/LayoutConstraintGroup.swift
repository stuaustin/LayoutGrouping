//
//  LayoutConstraintGroup.swift
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
 Represents a collection of one or more NSLayoutConstraint objects.
 This is used so that we can extend NSLayoutConstraint itself to conform to this.
 */
public protocol LayoutConstraintGroup {
    /**
     Convert this collection of one or more NSLayoutConstraint objects into an array of NSLayoutConstraint objects.

     - Returns: An array of NSLayoutConstraint objects, that the conforming object represents
     */
    func layoutConstraintArray() -> [NSLayoutConstraint]
}

// NSLayoutConstraint is made to conform to LayoutConstraintGroup,
// so that we can use NSLayoutConstraint and LayoutConstraintGroup types interchangibly.
extension NSLayoutConstraint: LayoutConstraintGroup {
    public func layoutConstraintArray() -> [NSLayoutConstraint] {
        return [self]
    }
}

extension Array: LayoutConstraintGroup where Element: NSLayoutConstraint {
    public func layoutConstraintArray() -> [NSLayoutConstraint] {
        return self
    }
}

// Functions making use of LayoutConstraintGroup
public extension NSLayoutConstraint {
    /**
     Activate all the constraints represented by the `constraintGroups`,
     optionally specifying a priority for convenience.

     - Parameter constraints: The collection of constraint groups to be activated
     - Parameter priority: Optionally specify the priority of all constraints that get activated.
                           This is just for convenience.
     */
    public class func activate(_ constraints: [LayoutConstraintGroup], priority: UILayoutPriority? = nil) {
        let constraintsArray: [NSLayoutConstraint] = Array(constraints.map { $0.layoutConstraintArray() }.joined())
        if let priority = priority {
            constraintsArray.forEach { $0.priority = priority }
        }
        NSLayoutConstraint.activate(constraintsArray)
    }

    /**
     Deactivate all the constraints represented by the `constraintGroups`.

     - Parameter constraints: The collection of constraint groups to be deactivated
     */
    public class func deactivate(_ constraints: [LayoutConstraintGroup]) {
        let constraintsArray: [NSLayoutConstraint] = Array(constraints.map { $0.layoutConstraintArray() }.joined())
        NSLayoutConstraint.deactivate(constraintsArray)
    }
}
