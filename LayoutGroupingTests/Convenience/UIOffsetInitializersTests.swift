//
//  UIOffsetInitializersTests.swift
//  LayoutGroupingTests
//
//  Created by Stuart Austin on 28/02/19.
//  Copyright © 2019 Stuart Austin. All rights reserved.
//

import XCTest
@testable import LayoutGrouping

class UIOffsetInitializersTests: XCTestCase {
    func testInitializers() {
        let horizontal: CGFloat = 1
        let vertical: CGFloat = 3

        let horizontalOffset = UIOffset(horizontal: horizontal)
        XCTAssert(horizontalOffset == UIOffset(horizontal: horizontal, vertical: 0), "Wrong UIOffset")

        let verticalOffset = UIOffset(vertical: vertical)
        XCTAssert(verticalOffset == UIOffset(horizontal: 0, vertical: vertical), "Wrong UIOffset")
    }
}
