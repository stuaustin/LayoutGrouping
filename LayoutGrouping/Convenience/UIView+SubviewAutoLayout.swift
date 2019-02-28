//
//  UIView+SubviewAutoLayout.swift
//  LayoutGrouping
//
//  Created by Stuart Austin on 26/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import UIKit

/**
 Extends UIView adding the ability to specify the value for `translatesAutoresizingMaskIntoConstraints`
 (called `useAutoLayout` for brevity) when adding or inserting a subview.
 */
public extension UIView {
    /**
     Adds a view to the end of the receiver’s list of subviews.
     - Parameter view: The view to be added. After being added, this view appears on top of any other subviews.
     - Parameter useAutoLayout:
        If true, `translatesAutoresizingMaskIntoConstraints` is set to false on the `view` parameter.
        If false, `translatesAutoresizingMaskIntoConstraints` is set to true on the `view` parameter.
     */
    public func addSubview(_ view: UIView, useAutoLayout: Bool) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = !useAutoLayout
    }

    /**
     Inserts a view below another view in the view hierarchy.
     - Parameter view: The view to insert below another view.
     It’s removed from its superview if it’s not a sibling of siblingSubview.
     - Parameter siblingSubview: The sibling view that will be above the inserted view.
     - Parameter useAutoLayout:
     If true, `translatesAutoresizingMaskIntoConstraints` is set to false on the `view` parameter.
     If false, `translatesAutoresizingMaskIntoConstraints` is set to true on the `view` parameter.
     */
    public func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView, useAutoLayout: Bool) {
        insertSubview(view, belowSubview: siblingSubview)
        view.translatesAutoresizingMaskIntoConstraints = !useAutoLayout
    }

    /**
     Inserts a view above another view in the view hierarchy.
     - Parameter view: The view to insert. It’s removed from its superview if it’s not a sibling of siblingSubview.
     - Parameter: siblingSubview: The sibling view that will be behind the inserted view.
     - Parameter useAutoLayout:
     If true, `translatesAutoresizingMaskIntoConstraints` is set to false on the `view` parameter.
     If false, `translatesAutoresizingMaskIntoConstraints` is set to true on the `view` parameter.
     */
    public func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView, useAutoLayout: Bool) {
        insertSubview(view, aboveSubview: siblingSubview)
        view.translatesAutoresizingMaskIntoConstraints = !useAutoLayout
    }
}
