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

        testAnchorView.fillSuperview(left: 0, right: 0, top: 0, bottom: 0)
        XCTAssert(testAnchorView.frame == testSuperview.frame)

        testAnchorView.fillSuperview(left: 10, right: 30, top: 55, bottom: 110)
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
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.topRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  960, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 10, yPad: 940, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x:  960, y: 940, width: 30, height: 40))
    }

    func testAnchorToEdge() {
        testAnchorView.anchorToEdge(.top, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 485, y: 10, width: 30, height: 40))

        testAnchorView.anchorToEdge(.left, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 480, width: 30, height: 40))

        testAnchorView.anchorToEdge(.bottom, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 485, y: 950, width: 30, height: 40))

        testAnchorView.anchorToEdge(.right, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 960, y: 480, width: 30, height: 40))
    }
//
//    func testAnchorAndFillEdge() {
//        testAnchorView.anchorAndFillEdge(edge: .Top, xPad: 10, yPad: 20, otherSize: 30)
//        XCTAssert(testAnchorView.frame == CGRect(x: 10, 20, 980, 30)))
//
//        testAnchorView.anchorAndFillEdge(edge: .Left, xPad: 10, yPad: 20, otherSize: 30)
//        XCTAssert(testAnchorView.frame == CGRect(x: 10, 20, 30, 960)))
//
//        testAnchorView.anchorAndFillEdge(edge: .Bottom, xPad: 10, yPad: 20, otherSize: 30)
//        XCTAssert(testAnchorView.frame == CGRect(x: 10, 950, 980, 30)))
//
//        testAnchorView.anchorAndFillEdge(edge: .Right, xPad: 10, yPad: 20, otherSize: 30)
//        XCTAssert(testAnchorView.frame == CGRect(x: 960, 20, 30, 960)))
//    }
//
//    func testAlign() {
//        testAnchorView.align(.ToTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 500, 30, 40)))
//
//        testAnchorView.align(.ToTheRightCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 530, 30, 40)))
//
//        testAnchorView.align(.ToTheRightMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 560, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 500, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 530, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 560, 30, 40)))
//
//        testAnchorView.align(.UnderMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 500, 610, 30, 40)))
//
//        testAnchorView.align(.UnderCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 535, 610, 30, 40)))
//
//        testAnchorView.align(.UnderMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 570, 610, 30, 40)))
//
//        testAnchorView.align(.AboveMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 500, 450, 30, 40)))
//
//        testAnchorView.align(.AboveCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 535, 450, 30, 40)))
//
//        testAnchorView.align(.AboveMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
//        XCTAssert(testAnchorView.frame == CGRect(x: 570, 450, 30, 40)))
//    }
//
//    func testAlignWithOffset() {
//        testAnchorView.align(.ToTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 10)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 510, 30, 40)))
//
//        testAnchorView.align(.ToTheRightCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 5)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 535, 30, 40)))
//
//        testAnchorView.align(.ToTheRightMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 20)
//        XCTAssert(testAnchorView.frame == CGRect(x: 610, 580, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 15)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 515, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 30)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 560, 30, 40)))
//
//        testAnchorView.align(.ToTheLeftMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 1)
//        XCTAssert(testAnchorView.frame == CGRect(x: 460, 561, 30, 40)))
//
//        testAnchorView.align(.UnderMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 10)
//        XCTAssert(testAnchorView.frame == CGRect(x: 510, 610, 30, 40)))
//
//        testAnchorView.align(.UnderCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 5)
//        XCTAssert(testAnchorView.frame == CGRect(x: 540, 610, 30, 40)))
//
//        testAnchorView.align(.UnderMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -10)
//        XCTAssert(testAnchorView.frame == CGRect(x: 560, 610, 30, 40)))
//
//        testAnchorView.align(.AboveMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -20)
//        XCTAssert(testAnchorView.frame == CGRect(x: 480, 450, 30, 40)))
//
//        testAnchorView.align(.AboveCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -1)
//        XCTAssert(testAnchorView.frame == CGRect(x: 534, 450, 30, 40)))
//
//        testAnchorView.align(.AboveMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -20)
//        XCTAssert(testAnchorView.frame == CGRect(x: 550, 450, 30, 40)))
//    }
//
//    func testAlignAndFillWidth() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, height: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 10, 920, 40)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10, height: 48)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 11, 920, 48)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingBottom, relativeTo: testAnchorView, padding: 10, height: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 30, 920, 30)))
//
//        testAnchorView.anchorInCorner(.TopRight, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingTop, relativeTo: testAnchorView, padding: 10, height: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 10, 920, 30)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftCentered, relativeTo: testAnchorView, padding: 20, height: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 20, 30, 900, 10)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingBottom, relativeTo: testAnchorView, padding: 15, height: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 15, 20, 910, 40)))
//    }
//
//    func testAlignAndFillWidthWithOffset() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, height: 40, offset: -20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, -10, 920, 40)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10, height: 48, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 21, 920, 48)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheRightMatchingBottom, relativeTo: testAnchorView, padding: 10, height: 30, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 40, 920, 30)))
//
//        testAnchorView.anchorInCorner(.TopRight, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingTop, relativeTo: testAnchorView, padding: 10, height: 30, offset: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 30, 920, 30)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftCentered, relativeTo: testAnchorView, padding: 20, height: 10, offset: 5)
//        XCTAssert(testSiblingView.frame == CGRect(x: 20, 35, 900, 10)))
//
//        testSiblingView.alignAndFillWidth(align: .ToTheLeftMatchingBottom, relativeTo: testAnchorView, padding: 15, height: 40, offset: 15)
//        XCTAssert(testSiblingView.frame == CGRect(x: 15, 35, 910, 40)))
//    }
//
//    func testAlignAndFillHeight() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillHeight(align: .UnderMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 100)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 70, 100, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .UnderCentered, relativeTo: testAnchorView, padding: 20, width: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 20, 80, 30, 900)))
//
//        testSiblingView.alignAndFillHeight(align: .UnderMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 20, 70, 40, 920)))
//
//        testAnchorView.anchorInCorner(.BottomRight, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillHeight(align: .AboveMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 950, 10, 40, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .AboveCentered, relativeTo: testAnchorView, padding: 10, width: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 945, 10, 40, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .AboveMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 940, 10, 40, 920)))
//    }
//
//    func testAlignAndFillHeightWithOffset() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillHeight(align: .UnderMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 100, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 20, 70, 100, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .UnderCentered, relativeTo: testAnchorView, padding: 20, width: 30, offset: 15)
//        XCTAssert(testSiblingView.frame == CGRect(x: 35, 80, 30, 900)))
//
//        testSiblingView.alignAndFillHeight(align: .UnderMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40, offset: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 40, 70, 40, 920)))
//
//        testAnchorView.anchorInCorner(.BottomRight, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFillHeight(align: .AboveMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40, offset: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 980, 10, 40, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .AboveCentered, relativeTo: testAnchorView, padding: 10, width: 40, offset: -10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 935, 10, 40, 920)))
//
//        testSiblingView.alignAndFillHeight(align: .AboveMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 40, offset: -20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 920, 10, 40, 920)))
//    }
//
//    func testAlignAndFill() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 10, 920, 980)))
//
//        testAnchorView.anchorToEdge(.Left, padding: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 10, 920, 980)))
//
//        testAnchorView.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 10, 920, 980)))
//    }
//
//    func testAlignAndFillWithOffset() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 20, 920, 970)))
//
//        testAnchorView.anchorToEdge(.Left, padding: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10, offset: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 30, 920, 980)))
//
//        testAnchorView.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10, width: 50, height: 50)
//
//        testSiblingView.alignAndFill(align: .ToTheRightCentered, relativeTo: testAnchorView, padding: 10, offset: -20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, -10, 920, 980)))
//    }
//
//    func testAlignBetweenHorizontal() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 50, height: 50)
//        testAnchorView2.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 50, height: 50)
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, height: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 60, 0, 880, 40)))
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 20, height: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 20, 860, 10)))
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingBottom, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 5, height: 40)
//        XCTAssert(testSiblingView.frame == CGRect(x: 55, 10, 890, 40)))
//    }
//
//    func testAlignBetweenHorizontalWithOffset() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 50, height: 50)
//        testAnchorView2.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 50, height: 50)
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, height: 40, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 60, 10, 880, 40)))
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 20, height: 10, offset: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 70, 40, 860, 10)))
//
//        testSiblingView.alignBetweenHorizontal(align: .ToTheRightMatchingBottom, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 5, height: 40, offset: -10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 55, 0, 890, 40)))
//    }
//
//    func testAlignBetweenVertical() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//        testAnchorView2.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSiblingView.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, width: 50)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 110, 50, 780)))
//
//        testSiblingView.alignBetweenVertical(align: .UnderCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 15, width: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 35, 115, 30, 770)))
//
//        testSiblingView.alignBetweenVertical(align: .UnderMatchingRight, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 3, width: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 90, 103, 10, 794)))
//    }
//
//    func testAlignBetweenVerticalWithOffset() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//        testAnchorView2.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSiblingView.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, width: 50, offset: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 110, 50, 780)))
//
//        testSiblingView.alignBetweenVertical(align: .UnderCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 15, width: 30, offset: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 55, 115, 30, 770)))
//
//        testSiblingView.alignBetweenVertical(align: .UnderMatchingRight, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 3, width: 10, offset: -10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 80, 103, 10, 794)))
//    }
//
//    func testGroupInCenter() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testAnchorView.groupInCenter(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 15, 40, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 40, 40, 20, 20)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 65, 40, 20, 20)))
//
//        testAnchorView.groupInCenter(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 40, 15, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 40, 40, 20, 20)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 40, 65, 20, 20)))
//    }
//
//    func testGroupInCornerHorizontal() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)
//
//        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopLeft, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 10, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 50, 10, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 90, 10, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopRight, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 380, 10, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 420, 10, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 460, 10, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomLeft, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 460, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 50, 460, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 90, 460, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomRight, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 380, 460, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 420, 460, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 460, 460, 30, 30)))
//    }
//
//    func testGroupInCornerVertical() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)
//
//        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopLeft, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 10, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 10, 50, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 10, 90, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .TopRight, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 460, 10, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 460, 50, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 460, 90, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomLeft, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 380, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 10, 420, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 10, 460, 30, 30)))
//
//        testAnchorView.groupInCorner(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .BottomRight, padding: 10, width: 30, height: 30)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 460, 380, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 460, 420, 30, 30)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 460, 460, 30, 30)))
//    }
//
//    func testGroupAgainstEdgeHorizontal() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)
//
//        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Top, padding: 5, width: 40, height: 40)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 185, 5, 40, 40)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 230, 5, 40, 40)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 275, 5, 40, 40)))
//
//        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Left, padding: 5, width: 40, height: 40)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 5, 230, 40, 40)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 50, 230, 40, 40)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 95, 230, 40, 40)))
//
//        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Bottom, padding: 5, width: 40, height: 40)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 185, 455, 40, 40)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 230, 455, 40, 40)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 275, 455, 40, 40)))
//
//        testAnchorView.groupAgainstEdge(group: .Horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Right, padding: 5, width: 40, height: 40)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 365, 230, 40, 40)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 410, 230, 40, 40)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 455, 230, 40, 40)))
//    }
//
//    func testGroupAgainstEdgeVertical() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 500, height: 500)
//        
//        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Top, padding: 10, width: 60, height: 60)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 220, 10, 60, 60)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 220, 80, 60, 60)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 220, 150, 60, 60)))
//        
//        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Left, padding: 10, width: 60, height: 60)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 150, 60, 60)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 10, 220, 60, 60)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 10, 290, 60, 60)))
//        
//        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Bottom, padding: 10, width: 60, height: 60)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 220, 290, 60, 60)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 220, 360, 60, 60)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 220, 430, 60, 60)))
//        
//        testAnchorView.groupAgainstEdge(group: .Vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .Right, padding: 10, width: 60, height: 60)
//        XCTAssert(testSiblingView2.frame == CGRect(x: 430, 150, 60, 60)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 430, 220, 60, 60)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 430, 290, 60, 60)))
//    }
//
//    func testGroupAndAlignHorizontal() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//        testSuperview.addSubview(testSiblingView2)
//        testSuperview.addSubview(testSiblingView3)
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 0, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 130, 0, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 155, 0, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 40, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 130, 40, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 155, 40, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 80, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 130, 80, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 155, 80, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 25, 105, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 50, 105, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 15, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 40, 105, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 65, 105, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 30, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 55, 105, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 80, 105, 20, 20)))
//
//        testAnchorView.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 825, 0, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 850, 0, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 0, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 825, 40, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 850, 40, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 40, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .ToTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 825, 80, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 850, 80, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 80, 20, 20)))
//
//        testAnchorView.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 865, 30, 30)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 35, 865, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 70, 865, 30, 30)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 865, 30, 30)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 35, 865, 30, 30)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 70, 865, 30, 30)))
//
//        testSuperview.groupAndAlign(group: .Horizontal, andAlign: .AboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 30, 875, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 55, 875, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 80, 875, 20, 20)))
//    }
//
//    func testGroupAndAlignVertical() {
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//        testSuperview.addSubview(testSiblingView2)
//        testSuperview.addSubview(testSiblingView3)
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 0, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 105, 25, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 105, 50, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 15, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 105, 40, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 105, 65, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 105, 30, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 105, 55, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 105, 80, 20, 20)))
//
//        testAnchorView.anchorInCorner(.TopRight, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 875, 0, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 875, 25, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 50, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 875, 15, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 875, 40, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 65, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .ToTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 875, 30, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 875, 55, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 875, 80, 20, 20)))
//
//        testAnchorView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 0, 130, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 0, 155, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 40, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 40, 130, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 40, 155, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .UnderMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 80, 105, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 80, 130, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 80, 155, 20, 20)))
//
//        testAnchorView.anchorInCorner(.BottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 0, 825, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 0, 850, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 0, 875, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 40, 825, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 40, 850, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 40, 875, 20, 20)))
//
//        testSuperview.groupAndAlign(group: .Vertical, andAlign: .AboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
//        XCTAssert(testSiblingView.frame == CGRect(x: 80, 825, 20, 20)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 80, 850, 20, 20)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 80, 875, 20, 20)))
//    }
//
//    func testGroupAndFill() {
//        testSuperview.addSubview(testSiblingView2)
//        testSuperview.addSubview(testSiblingView3)
//        testSuperview.addSubview(testSiblingView4)
//
//        testSuperview.groupAndFill(group: .Horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 10, 320, 980)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 340, 10, 320, 980)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 670, 10, 320, 980)))
//
//        testSuperview.groupAndFill(group: .Horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
//        XCTAssert(testSiblingView.frame == CGRect(x: 2, 2, 247.5, 996)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 251.5, 2, 247.5, 996)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 501, 2, 247.5, 996)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 750.5, 2, 247.5, 996)))
//
//        testSuperview.groupAndFill(group: .Vertical, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
//        XCTAssert(testSiblingView.frame == CGRect(x: 10, 10, 980, 320)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 10, 340, 980, 320)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 10, 670, 980, 320)))
//
//        testSuperview.groupAndFill(group: .Vertical, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
//        XCTAssert(testSiblingView.frame == CGRect(x: 2, 2, 996, 247.5)))
//        XCTAssert(testSiblingView2.frame == CGRect(x: 2, 251.5, 996, 247.5)))
//        XCTAssert(testSiblingView3.frame == CGRect(x: 2, 501, 996, 247.5)))
//        XCTAssert(testSiblingView4.frame == CGRect(x: 2, 750.5, 996, 247.5)))
//    }
}
