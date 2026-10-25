//
//  UIEdgeInsets+Initializers.swift
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
