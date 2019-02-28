//
//  UIEdgeInsets+Initializers.swift
//  LayoutGrouping
//
//  Created by Stuart Austin on 26/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import UIKit

/**
 Convenience initializers for UIEdgeInsets.
 These make any combination of initializer values possible, as long as they are in the original order.

 Essentially allows you to initialize UIEdgeInsets as if the main initializer were defined like so:
 `public init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0)`
 */
public extension UIEdgeInsets {
    public init(top: CGFloat, left: CGFloat, bottom: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: 0)
    }

    public init(top: CGFloat, left: CGFloat = 0, right: CGFloat) {
        self.init(top: top, left: left, bottom: 0, right: right)
    }

    public init(top: CGFloat, bottom: CGFloat, right: CGFloat = 0) {
        self.init(top: top, left: 0, bottom: bottom, right: right)
    }

    public init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    public init(bottom: CGFloat, right: CGFloat = 0) {
        self.init(top: 0, left: 0, bottom: bottom, right: right)
    }

    public init(left: CGFloat, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.init(top: 0, left: left, bottom: bottom, right: right)
    }

    public init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
}
