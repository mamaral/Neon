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

        testAnchorView.frame = CGRectZero
        testAnchorView2.frame = CGRectZero
        testSiblingView.frame = CGRectMake(500, 500, 100, 100)
        testSiblingView2.frame = CGRectZero
        testSiblingView3.frame = CGRectZero
        testSiblingView4.frame = CGRectZero
    }

    override func tearDown() {
        testAnchorView.frame = CGRectZero
        testAnchorView2.frame = CGRectZero
        testSiblingView.frame = CGRectZero
        testSiblingView2.frame = CGRectZero
        testSiblingView3.frame = CGRectZero
        testSiblingView4.frame = CGRectZero

        super.tearDown()
    }

    func testFrameUtils() {
        testAnchorView.frame = CGRectZero
        XCTAssertEqual(testAnchorView.x, 0)
        XCTAssertEqual(testAnchorView.xMid, 0)
        XCTAssertEqual(testAnchorView.xMax, 0)
        XCTAssertEqual(testAnchorView.y, 0)
        XCTAssertEqual(testAnchorView.yMid, 0)
        XCTAssertEqual(testAnchorView.yMax, 0)
        XCTAssertEqual(testAnchorView.width, 0)
        XCTAssertEqual(testAnchorView.height, 0)

        testAnchorView.frame = CGRectMake(10, 20, 30, 40)
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
        testAnchorView.anchorAndFillEdge(.Top, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 980, 30)))

        testAnchorView.anchorAndFillEdge(.Left, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 20, 30, 960)))

        testAnchorView.anchorAndFillEdge(.Bottom, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(10, 950, 980, 30)))

        testAnchorView.anchorAndFillEdge(.Right, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(CGRectEqualToRect(testAnchorView.frame, CGRectMake(960, 20, 30, 960)))
    }

    func testAlign() {
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

    func testGroupInCenter() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testAnchorView.groupInCenter(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(15, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(40, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(65, 40, 20, 20)))

        testAnchorView.groupInCenter(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(40, 15, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(40, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(40, 65, 20, 20)))
    }

    func testGroupInCornerHorizontal() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopLeft, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(50, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(90, 10, 30, 30)))

        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopRight, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(380, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(420, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(460, 10, 30, 30)))

        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomLeft, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 460, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(50, 460, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(90, 460, 30, 30)))

        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomRight, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(380, 460, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(420, 460, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(460, 460, 30, 30)))
    }

    func testGroupInCornerVertical() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopLeft, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(10, 50, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(10, 90, 30, 30)))

        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopRight, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(460, 10, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(460, 50, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(460, 90, 30, 30)))

        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomLeft, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 380, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(10, 420, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(10, 460, 30, 30)))

        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomRight, padding: 10, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(460, 380, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(460, 420, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(460, 460, 30, 30)))
    }

    func testGroupAgainstEdgeHorizontal() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Top, padding: 5, width: 40, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(185, 5, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(230, 5, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(275, 5, 40, 40)))

        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Left, padding: 5, width: 40, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(5, 230, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(50, 230, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(95, 230, 40, 40)))

        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Bottom, padding: 5, width: 40, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(185, 455, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(230, 455, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(275, 455, 40, 40)))

        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Right, padding: 5, width: 40, height: 40)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(365, 230, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(410, 230, 40, 40)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(455, 230, 40, 40)))
    }

    func testGroupAgainstEdgeVertical() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)
        
        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Top, padding: 10, width: 60, height: 60)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(220, 10, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(220, 80, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(220, 150, 60, 60)))
        
        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Left, padding: 10, width: 60, height: 60)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 150, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(10, 220, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(10, 290, 60, 60)))
        
        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Bottom, padding: 10, width: 60, height: 60)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(220, 290, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(220, 360, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(220, 430, 60, 60)))
        
        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Right, padding: 10, width: 60, height: 60)
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(430, 150, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(430, 220, 60, 60)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(430, 290, 60, 60)))
    }

    func testGroupAndAlignHorizontal() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(130, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(155, 0, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(130, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(155, 40, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 80, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(130, 80, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(155, 80, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(25, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(50, 105, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(15, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(40, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(65, 105, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(30, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(55, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(80, 105, 20, 20)))

        testAnchorView.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(825, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(850, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 0, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(825, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(850, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 40, 20, 20)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(825, 80, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(850, 80, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 80, 20, 20)))

        testAnchorView.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 865, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(35, 865, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(70, 865, 30, 30)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 865, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(35, 865, 30, 30)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(70, 865, 30, 30)))

        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(30, 875, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(55, 875, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(80, 875, 20, 20)))
    }

    func testGroupAndAlignVertical() {
        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(105, 25, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(105, 50, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 15, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(105, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(105, 65, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(105, 30, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(105, 55, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(105, 80, 20, 20)))

        testAnchorView.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(875, 0, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(875, 25, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 50, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(875, 15, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(875, 40, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 65, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(875, 30, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(875, 55, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(875, 80, 20, 20)))

        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(0, 130, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(0, 155, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(40, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(40, 130, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(40, 155, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(80, 105, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(80, 130, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(80, 155, 20, 20)))

        testAnchorView.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(0, 825, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(0, 850, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(0, 875, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(40, 825, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(40, 850, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(40, 875, 20, 20)))

        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(80, 825, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(80, 850, 20, 20)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(80, 875, 20, 20)))
    }

    func testGroupAndFill() {
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)
        testSuperview.addSubview(testSiblingView4)

        testSuperview.groupAndFill(group: .Horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(10, 10, 320, 980)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(340, 10, 320, 980)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(670, 10, 320, 980)))

        testSuperview.groupAndFill(group: .Horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(2, 2, 247.5, 996)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(251.5, 2, 247.5, 996)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(501, 2, 247.5, 996)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(750.5, 2, 247.5, 996)))

        testSuperview.groupAndFill(group: .Vertical, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(10, 10, 980, 320)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(10, 340, 980, 320)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(10, 670, 980, 320)))

        testSuperview.groupAndFill(group: .Vertical, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
        XCTAssert(CGRectEqualToRect(testSiblingView.frame, CGRectMake(2, 2, 996, 247.5)))
        XCTAssert(CGRectEqualToRect(testSiblingView2.frame, CGRectMake(2, 251.5, 996, 247.5)))
        XCTAssert(CGRectEqualToRect(testSiblingView3.frame, CGRectMake(2, 501, 996, 247.5)))
        XCTAssert(CGRectEqualToRect(testSiblingView4.frame, CGRectMake(2, 750.5, 996, 247.5)))
    }
}
