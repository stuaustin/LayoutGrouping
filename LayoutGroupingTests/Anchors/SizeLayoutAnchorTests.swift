//
//  SizeLayoutAnchorTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import XCTest
@testable import LayoutGrouping

class SizeLayoutAnchorTests: XCTestCase {
    func testEqualSizeLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.sizeAnchor.constraints(equalTo: layoutGuide.sizeAnchor,
                                                      constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let widthConstraint = constraints.first(where: { $0.firstAttribute == .width }) else {
            XCTAssert(false, "Missing width constraint")
            return
        }

        XCTAssert(widthConstraint.firstItem?.isEqual(view) ?? false
            && widthConstraint.relation == .equal
            && widthConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && widthConstraint.secondAttribute == .width
            && widthConstraint.constant == 3, "Wrong width constraint")

        guard let heightConstraint = constraints.first(where: { $0.firstAttribute == .height }) else {
            XCTAssert(false, "Missing height constraint")
            return
        }

        XCTAssert(heightConstraint.firstItem?.isEqual(view) ?? false
            && heightConstraint.relation == .equal
            && heightConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && heightConstraint.secondAttribute == .height
            && heightConstraint.constant == 5, "Wrong height constraint")
    }

    func testLessThanOrEqualSizeLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.sizeAnchor.constraints(lessThanOrEqualTo: layoutGuide.sizeAnchor,
                                                      constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let widthConstraint = constraints.first(where: { $0.firstAttribute == .width }) else {
            XCTAssert(false, "Missing width constraint")
            return
        }

        XCTAssert(widthConstraint.firstItem?.isEqual(view) ?? false
            && widthConstraint.relation == .lessThanOrEqual
            && widthConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && widthConstraint.secondAttribute == .width
            && widthConstraint.constant == 3, "Wrong width constraint")

        guard let heightConstraint = constraints.first(where: { $0.firstAttribute == .height }) else {
            XCTAssert(false, "Missing height constraint")
            return
        }

        XCTAssert(heightConstraint.firstItem?.isEqual(view) ?? false
            && heightConstraint.relation == .lessThanOrEqual
            && heightConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && heightConstraint.secondAttribute == .height
            && heightConstraint.constant == 5, "Wrong height constraint")
    }

    func testGreaterThanOrEqualSizeLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.sizeAnchor.constraints(greaterThanOrEqualTo: layoutGuide.sizeAnchor,
                                                      constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let widthConstraint = constraints.first(where: { $0.firstAttribute == .width }) else {
            XCTAssert(false, "Missing width constraint")
            return
        }

        XCTAssert(widthConstraint.firstItem?.isEqual(view) ?? false
            && widthConstraint.relation == .greaterThanOrEqual
            && widthConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && widthConstraint.secondAttribute == .width
            && widthConstraint.constant == 3, "Wrong width constraint")

        guard let heightConstraint = constraints.first(where: { $0.firstAttribute == .height }) else {
            XCTAssert(false, "Missing height constraint")
            return
        }

        XCTAssert(heightConstraint.firstItem?.isEqual(view) ?? false
            && heightConstraint.relation == .greaterThanOrEqual
            && heightConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && heightConstraint.secondAttribute == .height
            && heightConstraint.constant == 5, "Wrong height constraint")
    }
}
