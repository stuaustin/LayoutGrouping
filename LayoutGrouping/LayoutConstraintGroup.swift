//
//  LayoutConstraintGroup.swift
//  LayoutGrouping
//
//  Created by Stuart Austin on 26/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
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
