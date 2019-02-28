//
//  SizeLayoutAnchorTests.swift
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
