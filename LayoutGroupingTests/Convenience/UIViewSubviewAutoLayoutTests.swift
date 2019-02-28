//
//  UIViewSubviewAutoLayoutTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
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
