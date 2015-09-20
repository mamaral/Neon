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
    let testSuperview : UIView = UIView(frame: CGRectMake(0, 0, 1000, 1000))
    let testAnchorView : UIView = UIView()
    let testSiblingView : UIView = UIView()
    
    override func setUp() {
        super.setUp()

        testSuperview.addSubview(testAnchorView)
        testSuperview.addSubview(testSiblingView)

        testAnchorView.frame = CGRectZero
        testSiblingView.frame = CGRectMake(500, 500, 100, 100)
    }
    
    override func tearDown() {
        testAnchorView.frame = CGRectZero
        testSiblingView.frame = CGRectZero

        super.tearDown()
    }

    func testFrameUtils() {
        testAnchorView.frame = CGRectZero
        XCTAssertEqual(testAnchorView.x(), 0)
        XCTAssertEqual(testAnchorView.xMid(), 0)
        XCTAssertEqual(testAnchorView.xMax(), 0)
        XCTAssertEqual(testAnchorView.y(), 0)
        XCTAssertEqual(testAnchorView.yMid(), 0)
        XCTAssertEqual(testAnchorView.yMax(), 0)
        XCTAssertEqual(testAnchorView.width(), 0)
        XCTAssertEqual(testAnchorView.height(), 0)

        testAnchorView.frame = CGRectMake(10, 20, 30, 40)
        XCTAssertEqual(testAnchorView.x(), 10)
        XCTAssertEqual(testAnchorView.xMid(), 25)
        XCTAssertEqual(testAnchorView.xMax(), 40)
        XCTAssertEqual(testAnchorView.y(), 20)
        XCTAssertEqual(testAnchorView.yMid(), 40)
        XCTAssertEqual(testAnchorView.yMax(), 60)
        XCTAssertEqual(testAnchorView.width(), 30)
        XCTAssertEqual(testAnchorView.height(), 40)
    }
    
    func testFillSuperview() {
        testAnchorView.removeFromSuperview()
        testAnchorView.fillSuperview()
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.fillSuperview()
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, testSuperview.frame))

        testAnchorView.fillSuperview(left: 0, right: 0, top: 0, bottom: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, testSuperview.frame))

        testAnchorView.fillSuperview(left: 10, right: 30, top: 55, bottom: 110)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 55, 960, 835)))
    }

    func testAnchorInCenter() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(500, 500, 0, 0)))

        testAnchorView.anchorInCenter(width: 20, height: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(490, 485, 20, 30)))
    }

    func testAnchorInCorner() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 30, 40)))

        testAnchorView.anchorInCorner(.TopRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(960, 20, 30, 40)))

        testAnchorView.anchorInCorner(.BottomLeft, xPad: 10, yPad: 940, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 30, 40)))

        testAnchorView.anchorInCorner(.BottomRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(960, 940, 30, 40)))
    }

    func testAnchorToEdge() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorToEdge(.Top, padding: 10, width: 10, height: 10)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorToEdge(.Top, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(485, 10, 30, 40)))

        testAnchorView.anchorToEdge(.Left, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 480, 30, 40)))

        testAnchorView.anchorToEdge(.Bottom, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(485, 950, 30, 40)))

        testAnchorView.anchorToEdge(.Right, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(960, 480, 30, 40)))
    }

    func testAnchorAndFillEdge() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorAndFillEdge(.Top, xPad: 10, yPad: 10, otherSize: 10)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorAndFillEdge(.Top, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 980, 30)))

        testAnchorView.anchorAndFillEdge(.Left, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 30, 960)))

        testAnchorView.anchorAndFillEdge(.Bottom, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 950, 980, 30)))

        testAnchorView.anchorAndFillEdge(.Right, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(960, 20, 30, 960)))
    }

    // TODO: Determine if/how swift handles unit testing fatalError, similar to XCTAssertThrows in Obj-C,
    // so we can unit test these conditions.
    func testAlign() {
        testAnchorView.removeFromSuperview()
        testAnchorView.align(.ToTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectZero))

        testSuperview.addSubview(testAnchorView)

        testAnchorView.align(.ToTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(610, 500, 30, 40)))

        testAnchorView.align(.ToTheRightCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(610, 530, 30, 40)))

        testAnchorView.align(.ToTheRightMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(610, 560, 30, 40)))

        testAnchorView.align(.ToTheLeftMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(460, 500, 30, 40)))

        testAnchorView.align(.ToTheLeftCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(460, 530, 30, 40)))

        testAnchorView.align(.ToTheLeftMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(460, 560, 30, 40)))

        testAnchorView.align(.UnderMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(500, 610, 30, 40)))

        testAnchorView.align(.UnderCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(535, 610, 30, 40)))

        testAnchorView.align(.UnderMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(570, 610, 30, 40)))

        testAnchorView.align(.AboveMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(500, 450, 30, 40)))

        testAnchorView.align(.AboveCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(535, 450, 30, 40)))

        testAnchorView.align(.AboveMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(570, 450, 30, 40)))
    }

    // TODO: test alignAndFillWidth()
    // TODO: test alignAndFillHeight()
    // TODO: test all grouping methods
}
