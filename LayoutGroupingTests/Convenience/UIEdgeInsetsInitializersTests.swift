//
//  UIEdgeInsetsInitializersTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
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
