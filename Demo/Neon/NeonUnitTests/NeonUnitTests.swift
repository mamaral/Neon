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
    let testAnchorView2 : UIView = UIView()
    let testSiblingView : UIView = UIView()

    override func setUp() {
        super.setUp()

        testSuperview.addSubview(testAnchorView)
        testSuperview.addSubview(testAnchorView2)
        testSuperview.addSubview(testSiblingView)

        testAnchorView.frame = CGRectZero
        testAnchorView2.frame = CGRectZero
        testSiblingView.frame = CGRectMake(500, 500, 100, 100)
    }

    override func tearDown() {
        testAnchorView.frame = CGRectZero
        testAnchorView2.frame = CGRectZero
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

    func testAlignAndFillWidth() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 10, 920, 40)))

        testSiblingView.alignAndFillWidth(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10, height: 48)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 11, 920, 48)))

        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingBottom, relativeTo: testAnchorView, padding: 10, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 30, 920, 30)))

        testAnchorView.anchorInCorner(.TopRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingTop, relativeTo: testAnchorView, padding: 10, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(10, 10, 920, 30)))

        testSiblingView.alignAndFillWidth(align: .ToTheLeftCentered, relativeTo: testAnchorView, padding: 20, height: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(20, 30, 900, 10)))

        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingBottom, relativeTo: testAnchorView, padding: 15, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(15, 20, 910, 40)))
    }

    func testAlignAndFillHeight() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .UnderMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 100)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(10, 70, 100, 920)))

        testSiblingView.alignAndFillHeight(align: .UnderCentered, relativeTo: testAnchorView, padding: 20, width: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(20, 80, 30, 900)))

        testSiblingView.alignAndFillHeight(align: .UnderMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(20, 70, 40, 920)))

        testAnchorView.anchorInCorner(.BottomRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .AboveMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(950, 10, 40, 920)))

        testSiblingView.alignAndFillHeight(align: .AboveCentered, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(945, 10, 40, 920)))

        testSiblingView.alignAndFillHeight(align: .AboveMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(940, 10, 40, 920)))
    }

    func testAlignAndFill() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 10, 920, 980)))

        testAnchorView.anchorToEdge(.Left, padding: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 10, 920, 980)))

        testAnchorView.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 10, 920, 980)))
    }

    func testAlignBetweenHorizontal() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 50, height: 50)
        testAnchorView2.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 50, height: 50)

        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(60, 0, 880, 40)))

        testSiblingView.alignBetweenHorizontal(align: .ToTheRightCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 20, height: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(70, 20, 860, 10)))

        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingBottom, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 5, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(55, 10, 890, 40)))
    }

    func testAlignBetweenVertical() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testAnchorView2.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSiblingView.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, width: 50)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 110, 50, 780)))

        testSiblingView.alignBetweenVertical(align: .UnderCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 15, width: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(35, 115, 30, 770)))

        testSiblingView.alignBetweenVertical(align: .UnderMatchingRight, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 3, width: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(90, 103, 10, 794)))
    }

    // TODO: test groupInCenter()
    func testGroupInCenter() {

    }

    // TODO: test groupInCorner()
    func testGroupInCorner() {

    }

    // TODO: test groupAgainstEdge()
    func testGroupAgainstEdge() {

    }

    // TODO: test groupAndAlign()
    func testGroupAndAlign() {

    }

    // TODO: test groupAndFill()
    func testGroupAndFill() {

    }
}
