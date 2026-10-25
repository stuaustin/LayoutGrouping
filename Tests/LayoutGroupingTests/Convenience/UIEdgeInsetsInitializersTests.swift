//
//  UIEdgeInsetsInitializersTests.swift
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

import XCTest
@testable import LayoutGrouping

class UIEdgeInsetsInitializersTests: XCTestCase {
    func testInitializers() {
        let top: CGFloat = 1
        let left: CGFloat = 3
        let bottom: CGFloat = 5
        let right: CGFloat = 7

        // It is important to cover all possiblities for the initializers,
        // as we don't want to introduce any ambiguity

        let topInset = UIEdgeInsets(top: top)
        XCTAssert(topInset == UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0), "Wrong UIEdgeInsets")

        let topLeftInset = UIEdgeInsets(top: top, left: left)
        XCTAssert(topLeftInset == UIEdgeInsets(top: top, left: left, bottom: 0, right: 0), "Wrong UIEdgeInsets")

        let topRightInset = UIEdgeInsets(top: top, right: right)
        XCTAssert(topRightInset == UIEdgeInsets(top: top, left: 0, bottom: 0, right: right), "Wrong UIEdgeInsets")

        let topBottomInset = UIEdgeInsets(top: top, bottom: bottom)
        XCTAssert(topBottomInset == UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0), "Wrong UIEdgeInsets")

        let topLeftRightInset = UIEdgeInsets(top: top, left: left, right: right)
        XCTAssert(topLeftRightInset == UIEdgeInsets(top: top, left: left, bottom: 0, right: right),
                  "Wrong UIEdgeInsets")

        let topLeftBottomInset = UIEdgeInsets(top: top, left: left, bottom: bottom)
        XCTAssert(topLeftBottomInset == UIEdgeInsets(top: top, left: left, bottom: bottom, right: 0),
                  "Wrong UIEdgeInsets")

        let topBottomRightInset = UIEdgeInsets(top: top, bottom: bottom, right: right)
        XCTAssert(topBottomRightInset == UIEdgeInsets(top: top, left: 0, bottom: bottom, right: right),
                  "Wrong UIEdgeInsets")

        let leftInset = UIEdgeInsets(left: left)
        XCTAssert(leftInset == UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0), "Wrong UIEdgeInsets")

        let leftBottomInset = UIEdgeInsets(left: left, bottom: bottom)
        XCTAssert(leftBottomInset == UIEdgeInsets(top: 0, left: left, bottom: bottom, right: 0), "Wrong UIEdgeInsets")

        let leftRightInset = UIEdgeInsets(left: left, right: right)
        XCTAssert(leftRightInset == UIEdgeInsets(top: 0, left: left, bottom: 0, right: right), "Wrong UIEdgeInsets")

        let bottomInset = UIEdgeInsets(bottom: bottom)
        XCTAssert(bottomInset == UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: 0), "Wrong UIEdgeInsets")

        let bottomRightInset = UIEdgeInsets(bottom: bottom, right: right)
        XCTAssert(bottomRightInset == UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: right), "Wrong UIEdgeInsets")

        let rightInset = UIEdgeInsets(right: right)
        XCTAssert(rightInset == UIEdgeInsets(top: 0, left: 0, bottom: 0, right: right), "Wrong UIEdgeInsets")
    }
}
