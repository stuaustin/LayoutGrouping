//
//  UIViewSubviewAutoLayoutTests.swift
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

class UIViewSubviewAutoLayoutTests: XCTestCase {
    func testAddSubview() {
        let view = UIView()
        let subview = UIView()

        view.addSubview(subview, useAutoLayout: true)
        XCTAssert(!subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")

        view.addSubview(subview, useAutoLayout: false)
        XCTAssert(subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")
    }

    func testInsertBelowSubview() {
        let view = UIView()

        let bottomMostSubview = UIView()
        view.addSubview(bottomMostSubview)

        let siblingSubview = UIView()
        view.addSubview(siblingSubview)

        let topMostSubview = UIView()
        view.addSubview(topMostSubview)

        let subview = UIView()
        view.insertSubview(subview, belowSubview: siblingSubview, useAutoLayout: true)
        XCTAssert(!subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")
        XCTAssert(view.subviews.index(of: subview) == 1, "Wrong subview position")

        view.insertSubview(subview, belowSubview: siblingSubview, useAutoLayout: false)
        XCTAssert(subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")
        XCTAssert(view.subviews.index(of: subview) == 1, "Wrong subview position")
    }

    func testInsertAboveSubview() {
        let view = UIView()

        let bottomMostSubview = UIView()
        view.addSubview(bottomMostSubview)

        let siblingSubview = UIView()
        view.addSubview(siblingSubview)

        let topMostSubview = UIView()
        view.addSubview(topMostSubview)

        let subview = UIView()
        view.insertSubview(subview, aboveSubview: siblingSubview, useAutoLayout: true)
        XCTAssert(!subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")
        XCTAssert(view.subviews.index(of: subview) == 2, "Wrong subview position")

        view.insertSubview(subview, aboveSubview: siblingSubview, useAutoLayout: false)
        XCTAssert(subview.translatesAutoresizingMaskIntoConstraints,
                  "Wrong translatesAutoresizingMaskIntoConstraints value")
        XCTAssert(view.subviews.index(of: subview) == 2, "Wrong subview position")
    }
}
