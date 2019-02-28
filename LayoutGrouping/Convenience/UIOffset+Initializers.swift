//
//  UIOffset+Initializers.swift
//  LayoutGrouping
//
//  Created by Stuart Austin on 26/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import UIKit

/**
 Convenience initializers for UIOffset, allowing you to specify only one value
 */
public extension UIOffset {
    public init(horizontal: CGFloat) {
        self.init(horizontal: horizontal, vertical: 0)
    }

    public init(vertical: CGFloat) {
        self.init(horizontal: 0, vertical: vertical)
    }
}
