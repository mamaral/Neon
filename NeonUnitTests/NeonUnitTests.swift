//
//  NeonTests.swift
//  NeonTests
//
//  Created by Mike on 9/16/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import XCTest
@testable import Neon

class NeonTests: XCTestCase {
    let testSuperview : UIView = UIView(frame: CGRect(x:  0, y: 0, width: 1000, height: 1000))
    let testAnchorView : UIView = UIView()
    let testAnchorView2 : UIView = UIView()
    let testSiblingView : UIView = UIView()
    let testSiblingView2 : UIView = UIView()
    let testSiblingView3 : UIView = UIView()
    let testSiblingView4 : UIView = UIView()

    override func setUp() {
        super.setUp()

        testSuperview.addSubview(testAnchorView)
        testSuperview.addSubview(testAnchorView2)
        testSuperview.addSubview(testSiblingView)
        testAnchorView.addSubview(testSiblingView2)
        testAnchorView.addSubview(testSiblingView3)
        testAnchorView.addSubview(testSiblingView4)

        testAnchorView.frame = CGRect.zero
        testAnchorView2.frame = CGRect.zero
        testSiblingView.frame = CGRect(x:  500, y: 500, width: 100, height: 100)
        testSiblingView2.frame = CGRect.zero
        testSiblingView3.frame = CGRect.zero
        testSiblingView4.frame = CGRect.zero
    }

    override func tearDown() {
        testAnchorView.frame = CGRect.zero
        testAnchorView2.frame = CGRect.zero
        testSiblingView.frame = CGRect.zero
        testSiblingView2.frame = CGRect.zero
        testSiblingView3.frame = CGRect.zero
        testSiblingView4.frame = CGRect.zero

        super.tearDown()
    }

    func testFrameUtils() {
        testAnchorView.frame = CGRect.zero
        XCTAssertEqual(testAnchorView.x, 0)
        XCTAssertEqual(testAnchorView.xMid, 0)
        XCTAssertEqual(testAnchorView.xMax, 0)
        XCTAssertEqual(testAnchorView.y, 0)
        XCTAssertEqual(testAnchorView.yMid, 0)
        XCTAssertEqual(testAnchorView.yMax, 0)
        XCTAssertEqual(testAnchorView.width, 0)
        XCTAssertEqual(testAnchorView.height, 0)

        testAnchorView.frame = CGRect(x:  10, y: 20, width: 30, height: 40)
        XCTAssertEqual(testAnchorView.x, 10)
        XCTAssertEqual(testAnchorView.xMid, 25)
        XCTAssertEqual(testAnchorView.xMax, 40)
        XCTAssertEqual(testAnchorView.y, 20)
        XCTAssertEqual(testAnchorView.yMid, 40)
        XCTAssertEqual(testAnchorView.yMax, 60)
        XCTAssertEqual(testAnchorView.width, 30)
        XCTAssertEqual(testAnchorView.height, 40)
    }

    func testFillSuperview() {
        testAnchorView.removeFromSuperview()
        testAnchorView.fillSuperview()
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.fillSuperview()
        XCTAssert(testAnchorView.frame == testSuperview.frame)

        testAnchorView.fillSuperview(leading: 0, trailing: 0, top: 0, bottom: 0)
        XCTAssert(testAnchorView.frame == testSuperview.frame)

        testAnchorView.fillSuperview(leading: 10, trailing: 30, top: 55, bottom: 110)
        XCTAssert(testAnchorView.frame == CGRect(x:  10, y: 55, width: 960, height: 835))
    }

    func testAnchorInCenter() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect(x:  500, y: 500, width: 0, height: 0))

        testAnchorView.anchorInCenter(width: 20, height: 30)
        XCTAssert(testAnchorView.frame == CGRect(x:  490, y: 485, width: 20, height: 30))
    }

    func testAnchorInCorner() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCorner(.topLeading, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCorner(.topLeading, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testAnchorView.anchorInCorner(.topLeading, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.topTrailing, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  960, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomLeading, xPad: 10, yPad: 940, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomTrailing, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  960, y: 940, width: 30, height: 40))
    }

    func testAnchorToEdge() {
        testAnchorView.anchorToEdge(.top, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 485, y: 10, width: 30, height: 40))

        testAnchorView.anchorToEdge(.leading, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 480, width: 30, height: 40))

        testAnchorView.anchorToEdge(.bottom, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 485, y: 950, width: 30, height: 40))

        testAnchorView.anchorToEdge(.trailing, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 960, y: 480, width: 30, height: 40))
    }
}
