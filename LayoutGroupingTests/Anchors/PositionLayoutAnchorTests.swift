//
//  PositionLayoutAnchorTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import XCTest
@testable import LayoutGrouping

class PositionLayoutAnchorTests: XCTestCase {
    func testEqualLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.topLeadingAnchor.constraints(equalTo: layoutGuide.bottomTrailingAnchor,
                                                         constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .equal
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .bottom
            && topConstraint.constant == 5, "Wrong top constraint")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .equal
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .trailing
            && leadingConstraint.constant == 3, "Wrong leading constraint")
    }

    func testLessThanOrEqualLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.topTrailingAnchor.constraints(lessThanOrEqualTo: layoutGuide.bottomLeadingAnchor,
                                                            constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .lessThanOrEqual
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .bottom
            && topConstraint.constant == 5, "Wrong top constraint")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .lessThanOrEqual
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .leading
            && trailingConstraint.constant == 3, "Wrong trailing constraint")
    }

    func testGreaterThanOrEqualLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.bottomLeftAnchor.constraints(greaterThanOrEqualTo: layoutGuide.topRightAnchor,
                                                             constant: UIOffset(horizontal: 3, vertical: 5))

        XCTAssert(constraints.count == 2, "Wrong number of constraints")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .greaterThanOrEqual
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .top
            && bottomConstraint.constant == 5, "Wrong bottom constraint")

        guard let leftConstraint = constraints.first(where: { $0.firstAttribute == .left }) else {
            XCTAssert(false, "Missing left constraint")
            return
        }

        XCTAssert(leftConstraint.firstItem?.isEqual(view) ?? false
            && leftConstraint.relation == .greaterThanOrEqual
            && leftConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leftConstraint.secondAttribute == .right
            && leftConstraint.constant == 3, "Wrong left constraint")
    }

    func testTopLeftAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.topLeftAnchor

        XCTAssert(anchor.horizontal == item.leftAnchor
            && anchor.vertical == item.topAnchor, "Wrong anchors")
    }

    func testTopRightAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.topRightAnchor

        XCTAssert(anchor.horizontal == item.rightAnchor
            && anchor.vertical == item.topAnchor, "Wrong anchors")
    }

    func testTopLeadingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.topLeadingAnchor

        XCTAssert(anchor.horizontal == item.leadingAnchor
            && anchor.vertical == item.topAnchor, "Wrong anchors")
    }

    func testTopTrailingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.topTrailingAnchor

        XCTAssert(anchor.horizontal == item.trailingAnchor
            && anchor.vertical == item.topAnchor, "Wrong anchors")
    }

    func testTopCenterXAnchor () {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.topCenterXAnchor

        XCTAssert(anchor.horizontal == item.centerXAnchor
            && anchor.vertical == item.topAnchor, "Wrong anchors")
    }

    func testBottomLeftAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.bottomLeftAnchor

        XCTAssert(anchor.horizontal == item.leftAnchor
            && anchor.vertical == item.bottomAnchor, "Wrong anchors")
    }

    func testBottomRightAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.bottomRightAnchor

        XCTAssert(anchor.horizontal == item.rightAnchor
            && anchor.vertical == item.bottomAnchor, "Wrong anchors")
    }

    func testBottomLeadingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.bottomLeadingAnchor

        XCTAssert(anchor.horizontal == item.leadingAnchor
            && anchor.vertical == item.bottomAnchor, "Wrong anchors")
    }

    func testBottomTrailingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.bottomTrailingAnchor

        XCTAssert(anchor.horizontal == item.trailingAnchor
            && anchor.vertical == item.bottomAnchor, "Wrong anchors")
    }

    func testBottomCenterXAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.bottomCenterXAnchor

        XCTAssert(anchor.horizontal == item.centerXAnchor
            && anchor.vertical == item.bottomAnchor, "Wrong anchors")
    }

    func testCenterYLeftAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.centerYLeftAnchor

        XCTAssert(anchor.horizontal == item.leftAnchor
            && anchor.vertical == item.centerYAnchor, "Wrong anchors")
    }

    func testCenterYRightAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.centerYRightAnchor

        XCTAssert(anchor.horizontal == item.rightAnchor
            && anchor.vertical == item.centerYAnchor, "Wrong anchors")
    }

    func testCenterYLeadingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.centerYLeadingAnchor

        XCTAssert(anchor.horizontal == item.leadingAnchor
            && anchor.vertical == item.centerYAnchor, "Wrong anchors")
    }

    func testCenterYTrailingAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.centerYTrailingAnchor

        XCTAssert(anchor.horizontal == item.trailingAnchor
            && anchor.vertical == item.centerYAnchor, "Wrong anchors")
    }

    func testCenterYCenterXAnchor() {
        let item: PositionableLayoutItem = UIView()
        let anchor = item.centerYCenterXAnchor

        XCTAssert(anchor.horizontal == item.centerXAnchor
            && anchor.vertical == item.centerYAnchor, "Wrong anchors")
    }
}
