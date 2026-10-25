//
//  UIView+SubviewAutoLayout.swift
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
