//
//  BoxLayoutAnchorTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import XCTest
@testable import LayoutGrouping

// swiftlint:disable type_body_length file_length
class BoxLayoutAnchorTests: XCTestCase {
    func testEqualBoxLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(equalTo: layoutGuide.boxAnchor,
                                                     constant: UIEdgeInsets(top: 2, left: 3, bottom: 5, right: 7))

        XCTAssert(constraints.count == 4, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .equal
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .equal
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .equal
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .equal
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testInsideOfOrEqualBoxLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(insideOfOrEqualTo: layoutGuide.boxAnchor,
                                                     constant: UIEdgeInsets(top: 2, left: 3, bottom: 5, right: 7))

        XCTAssert(constraints.count == 4, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .greaterThanOrEqual
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .lessThanOrEqual
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .greaterThanOrEqual
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .lessThanOrEqual
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testOutsideOfOrEqualBoxLayoutAnchors() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(outsideOfOrEqualTo: layoutGuide.boxAnchor,
                                                     constant: UIEdgeInsets(top: 2, left: 3, bottom: 5, right: 7))

        XCTAssert(constraints.count == 4, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .lessThanOrEqual
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .greaterThanOrEqual
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .lessThanOrEqual
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .greaterThanOrEqual
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testEqualBoxLayoutAnchorsTopEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(equalTo: layoutGuide.boxAnchor, edges: .top,
                                                     constant: UIEdgeInsets(top: 2))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .equal
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")
    }

    func testEqualBoxLayoutAnchorsBottomEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(equalTo: layoutGuide.boxAnchor, edges: .bottom,
                                                     constant: UIEdgeInsets(bottom: 5))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .equal
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testEqualBoxLayoutAnchorsLeadingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(equalTo: layoutGuide.boxAnchor, edges: .leading,
                                                     constant: UIEdgeInsets(left: 3))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .equal
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")
    }

    func testEqualBoxLayoutAnchorsTrailingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(equalTo: layoutGuide.boxAnchor, edges: .trailing,
                                                     constant: UIEdgeInsets(right: 7))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .equal
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")
    }

    func testInsideOfOrEqualBoxLayoutAnchorsTopEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(insideOfOrEqualTo: layoutGuide.boxAnchor, edges: .top,
                                                     constant: UIEdgeInsets(top: 2))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .greaterThanOrEqual
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")
    }

    func testInsideOfOrEqualBoxLayoutAnchorsBottomEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(insideOfOrEqualTo: layoutGuide.boxAnchor, edges: .bottom,
                                                     constant: UIEdgeInsets(bottom: 5))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .lessThanOrEqual
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testInsideOfOrEqualBoxLayoutAnchorsLeadingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(insideOfOrEqualTo: layoutGuide.boxAnchor, edges: .leading,
                                                     constant: UIEdgeInsets(left: 3))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .greaterThanOrEqual
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")
    }

    func testInsideOfOrEqualBoxLayoutAnchorsTrailingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(insideOfOrEqualTo: layoutGuide.boxAnchor, edges: .trailing,
                                                     constant: UIEdgeInsets(right: 7))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .lessThanOrEqual
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")
    }

    func testOutsideOfOrEqualBoxLayoutAnchorsTopEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(outsideOfOrEqualTo: layoutGuide.boxAnchor, edges: .top,
                                                     constant: UIEdgeInsets(top: 2))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let topConstraint = constraints.first(where: { $0.firstAttribute == .top }) else {
            XCTAssert(false, "Missing top constraint")
            return
        }

        XCTAssert(topConstraint.firstItem?.isEqual(view) ?? false
            && topConstraint.relation == .lessThanOrEqual
            && topConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && topConstraint.secondAttribute == .top
            && topConstraint.constant == 2, "Wrong top constraint")
    }

    func testOutsideOfOrEqualBoxLayoutAnchorsBottomEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(outsideOfOrEqualTo: layoutGuide.boxAnchor, edges: .bottom,
                                                     constant: UIEdgeInsets(bottom: 5))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let bottomConstraint = constraints.first(where: { $0.firstAttribute == .bottom }) else {
            XCTAssert(false, "Missing bottom constraint")
            return
        }

        XCTAssert(bottomConstraint.firstItem?.isEqual(view) ?? false
            && bottomConstraint.relation == .greaterThanOrEqual
            && bottomConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && bottomConstraint.secondAttribute == .bottom
            && bottomConstraint.constant == -5, "Wrong bottom constraint")
    }

    func testOutsideOfOrEqualBoxLayoutAnchorsLeadingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(outsideOfOrEqualTo: layoutGuide.boxAnchor, edges: .leading,
                                                     constant: UIEdgeInsets(left: 3))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let leadingConstraint = constraints.first(where: { $0.firstAttribute == .leading }) else {
            XCTAssert(false, "Missing leading constraint")
            return
        }

        XCTAssert(leadingConstraint.firstItem?.isEqual(view) ?? false
            && leadingConstraint.relation == .lessThanOrEqual
            && leadingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && leadingConstraint.secondAttribute == .leading
            && leadingConstraint.constant == 3, "Wrong leading constraint")
    }

    func testOutsideOfOrEqualBoxLayoutAnchorsTrailingEdge() {
        let view = UIView()
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)

        let constraints = view.boxAnchor.constraints(outsideOfOrEqualTo: layoutGuide.boxAnchor, edges: .trailing,
                                                     constant: UIEdgeInsets(right: 7))

        XCTAssert(constraints.count == 1, "Wrong number of constraints")

        guard let trailingConstraint = constraints.first(where: { $0.firstAttribute == .trailing }) else {
            XCTAssert(false, "Missing trailing constraint")
            return
        }

        XCTAssert(trailingConstraint.firstItem?.isEqual(view) ?? false
            && trailingConstraint.relation == .greaterThanOrEqual
            && trailingConstraint.secondItem?.isEqual(layoutGuide) ?? false
            && trailingConstraint.secondAttribute == .trailing
            && trailingConstraint.constant == -7, "Wrong trailing constraint")
    }
}
