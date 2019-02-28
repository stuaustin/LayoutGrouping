//
//  LayoutConstraintGroupTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import XCTest
@testable import LayoutGrouping

class LayoutConstraintGroupTests: XCTestCase {

    func testSingleLayoutConstraintGroup() {
        let view = UIView()
        let testLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(testLayoutGuide)

        let testConstraint = NSLayoutConstraint(item: view, attribute: .width,
                                                relatedBy: .equal,
                                                toItem: testLayoutGuide, attribute: .width,
                                                multiplier: 1, constant: 0)

        XCTAssert([testConstraint] == testConstraint.layoutConstraintArray(), "Wrong single constraint group array")
    }

    func testMultipleLayoutConstraintGroup() {
        let view = UIView()
        let testLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(testLayoutGuide)

        let testConstraintA = NSLayoutConstraint(item: view, attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: testLayoutGuide, attribute: .width,
                                                 multiplier: 1, constant: 0)

        let testConstraintB = NSLayoutConstraint(item: view, attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: testLayoutGuide, attribute: .height,
                                                 multiplier: 1, constant: 0)

        XCTAssert([testConstraintA, testConstraintB] == [testConstraintA, testConstraintB].layoutConstraintArray(),
                  "Wrong constraint group array")
    }

    func testConstraintGroupActivation() {
        let view = UIView()
        let testLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(testLayoutGuide)

        let testConstraintA = NSLayoutConstraint(item: view, attribute: .width,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .width,
                                                 multiplier: 1, constant: 0)

        let testConstraintB = NSLayoutConstraint(item: view, attribute: .height,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .height,
                                                 multiplier: 1, constant: 0)
        testConstraintB.isActive = true

        let testConstraintC = NSLayoutConstraint(item: view, attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: testLayoutGuide, attribute: .top,
                                                 multiplier: 1, constant: 0)

        let testConstraintD = NSLayoutConstraint(item: view, attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: testLayoutGuide, attribute: .leading,
                                                 multiplier: 1, constant: 0)

        let constraintGroups: LayoutConstraintGroup = [testConstraintA,
                                                       testConstraintB,
                                                       testConstraintC,
                                                       testConstraintD]

        NSLayoutConstraint.activate([constraintGroups])

        XCTAssert(testConstraintA.isActive && testConstraintB.isActive
            && testConstraintC.isActive && testConstraintD.isActive,
                  "LayoutConstraintGroup activation failed")
    }

    func testLayoutConstraintGroupActivationPriority() {
        let view = UIView()
        let testLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(testLayoutGuide)

        let testConstraintA = NSLayoutConstraint(item: view, attribute: .width,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .width,
                                                 multiplier: 1, constant: 0)
        testConstraintA.priority = .defaultLow

        let testConstraintB = NSLayoutConstraint(item: view, attribute: .height,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .height,
                                                 multiplier: 1, constant: 0)
        testConstraintB.priority = .required

        let constraintGroups: LayoutConstraintGroup = [testConstraintA,
                                                       testConstraintB]

        NSLayoutConstraint.activate([constraintGroups], priority: .defaultHigh)
        XCTAssert(testConstraintA.priority == .defaultHigh, "LayoutConstraintGroup set priority failed")
        XCTAssert(testConstraintB.priority == .defaultHigh, "LayoutConstraintGroup set priority failed")
    }

    func testConstraintGroupDeactivation() {
        let view = UIView()
        let testLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(testLayoutGuide)

        let testConstraintA = NSLayoutConstraint(item: view, attribute: .width,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .width,
                                                 multiplier: 1, constant: 0)
        testConstraintA.isActive = true

        let testConstraintB = NSLayoutConstraint(item: view, attribute: .height,
                                                 relatedBy: .greaterThanOrEqual,
                                                 toItem: testLayoutGuide, attribute: .height,
                                                 multiplier: 1, constant: 0)
        testConstraintB.isActive = true

        let testConstraintC = NSLayoutConstraint(item: view, attribute: .top,
                                                 relatedBy: .equal, toItem: testLayoutGuide, attribute: .top,
                                                 multiplier: 1, constant: 0)
        testConstraintC.isActive = true

        let testConstraintD = NSLayoutConstraint(item: view, attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: testLayoutGuide, attribute: .leading,
                                                 multiplier: 1, constant: 0)
        testConstraintD.isActive = true

        let constraintGroups: LayoutConstraintGroup = [testConstraintA,
                                                       testConstraintB,
                                                       testConstraintC,
                                                       testConstraintD]
        NSLayoutConstraint.deactivate([constraintGroups])

        XCTAssert(!testConstraintA.isActive, "LayoutConstraintGroup deactivation failed")
        XCTAssert(!testConstraintB.isActive, "LayoutConstraintGroup deactivation failed")
        XCTAssert(!testConstraintC.isActive, "LayoutConstraintGroup deactivation failed")
        XCTAssert(!testConstraintD.isActive, "LayoutConstraintGroup deactivation failed")
    }
}
