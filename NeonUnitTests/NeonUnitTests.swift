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
    let testSuperview : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
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
        testSiblingView.frame = CGRect(x: 500, y: 500, width: 100, height: 100)
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

    func testAutoHeightWithRestrictedWidth() {
        let label = UILabel()
        label.text = String(repeating: "some text ", count: 100)
        label.numberOfLines = 0

        testSuperview.addSubview(label)
        label.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: AutoHeight)

        let targetLabelHeight = label.sizeThatFits(CGSize(width: 100, height: 0)).height
        XCTAssertEqual(label.frame, CGRect(x: 0, y: 0, width: 100, height: targetLabelHeight))
    }

    func testAutoWidthHeight() {
        let label = UILabel()
        label.text = "some text"
        label.numberOfLines = 0

        testSuperview.addSubview(label)
        label.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: AutoWidth, height: AutoHeight)

        let targetLabelSize = label.sizeThatFits(.zero)
        XCTAssertEqual(label.frame, CGRect(x: 0, y: 0, width: targetLabelSize.width, height: targetLabelSize.height))
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

        testAnchorView.frame = CGRect(x: 10, y: 20, width: 30, height: 40)
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
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 55, width: 960, height: 835))
    }

    func testAnchorInCenter() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCenter(width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect(x: 500, y: 500, width: 0, height: 0))

        testAnchorView.anchorInCenter(width: 20, height: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 490, y: 485, width: 20, height: 30))
    }

    func testAnchorInCorner() {
        testAnchorView.removeFromSuperview()
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testSuperview.addSubview(testAnchorView)

        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 0, height: 0)
        XCTAssert(testAnchorView.frame == CGRect.zero)

        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.topRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 960, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 10, yPad: 940, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 20, width: 30, height: 40))

        testAnchorView.anchorInCorner(.bottomRight, xPad: 10, yPad: 20, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 960, y: 940, width: 30, height: 40))
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

    func testAnchorAndFillEdge() {
        testAnchorView.anchorAndFillEdge(.top, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 20, width: 980, height: 30))

        testAnchorView.anchorAndFillEdge(.left, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 20, width: 30, height: 960))

        testAnchorView.anchorAndFillEdge(.bottom, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 10, y: 950, width: 980, height: 30))

        testAnchorView.anchorAndFillEdge(.right, xPad: 10, yPad: 20, otherSize: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 960, y: 20, width: 30, height: 960))
    }

    func testAlign() {
        testAnchorView.align(.toTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 500, width: 30, height: 40))

        testAnchorView.align(.toTheRightCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 530, width: 30, height: 40))

        testAnchorView.align(.toTheRightMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 560, width: 30, height: 40))

        testAnchorView.align(.toTheLeftMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 500, width: 30, height: 40))

        testAnchorView.align(.toTheLeftCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 530, width: 30, height: 40))

        testAnchorView.align(.toTheLeftMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 560, width: 30, height: 40))

        testAnchorView.align(.underMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 500, y: 610, width: 30, height: 40))

        testAnchorView.align(.underCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 535, y: 610, width: 30, height: 40))

        testAnchorView.align(.underMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 570, y: 610, width: 30, height: 40))

        testAnchorView.align(.aboveMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 500, y: 450, width: 30, height: 40))

        testAnchorView.align(.aboveCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 535, y: 450, width: 30, height: 40))

        testAnchorView.align(.aboveMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40)
        XCTAssert(testAnchorView.frame == CGRect(x: 570, y: 450, width: 30, height: 40))
    }

    func testAlignWithOffset() {
        testAnchorView.align(.toTheRightMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 10)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 510, width: 30, height: 40))

        testAnchorView.align(.toTheRightCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 5)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 535, width: 30, height: 40))

        testAnchorView.align(.toTheRightMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 20)
        XCTAssert(testAnchorView.frame == CGRect(x: 610, y: 580, width: 30, height: 40))

        testAnchorView.align(.toTheLeftMatchingTop, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 15)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 515, width: 30, height: 40))

        testAnchorView.align(.toTheLeftCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 30)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 560, width: 30, height: 40))

        testAnchorView.align(.toTheLeftMatchingBottom, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 1)
        XCTAssert(testAnchorView.frame == CGRect(x: 460, y: 561, width: 30, height: 40))

        testAnchorView.align(.underMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 10)
        XCTAssert(testAnchorView.frame == CGRect(x: 510, y: 610, width: 30, height: 40))

        testAnchorView.align(.underCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: 5)
        XCTAssert(testAnchorView.frame == CGRect(x: 540, y: 610, width: 30, height: 40))

        testAnchorView.align(.underMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -10)
        XCTAssert(testAnchorView.frame == CGRect(x: 560, y: 610, width: 30, height: 40))

        testAnchorView.align(.aboveMatchingLeft, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -20)
        XCTAssert(testAnchorView.frame == CGRect(x: 480, y: 450, width: 30, height: 40))

        testAnchorView.align(.aboveCentered, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -1)
        XCTAssert(testAnchorView.frame == CGRect(x: 534, y: 450, width: 30, height: 40))

        testAnchorView.align(.aboveMatchingRight, relativeTo: testSiblingView, padding: 10, width: 30, height: 40, offset: -20)
        XCTAssert(testAnchorView.frame == CGRect(x: 550, y: 450, width: 30, height: 40))
    }

    func testAlignAndFillWidth() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .toTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, height: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 10, width: 920, height: 40))

        testSiblingView.alignAndFillWidth(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10, height: 48)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 11, width: 920, height: 48))

        testSiblingView.alignAndFillWidth(align: .toTheRightMatchingBottom, relativeTo: testAnchorView, padding: 10, height: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 30, width: 920, height: 30))

        testAnchorView.anchorInCorner(.topRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .toTheLeftMatchingTop, relativeTo: testAnchorView, padding: 10, height: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 10, width: 920, height: 30))

        testSiblingView.alignAndFillWidth(align: .toTheLeftCentered, relativeTo: testAnchorView, padding: 20, height: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 20, y: 30, width: 900, height: 10))

        testSiblingView.alignAndFillWidth(align: .toTheLeftMatchingBottom, relativeTo: testAnchorView, padding: 15, height: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 15, y: 20, width: 910, height: 40))
    }

    func testAlignAndFillWidthWithOffset() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .toTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, height: 40, offset: -20)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: -10, width: 920, height: 40))

        testSiblingView.alignAndFillWidth(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10, height: 48, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 21, width: 920, height: 48))

        testSiblingView.alignAndFillWidth(align: .toTheRightMatchingBottom, relativeTo: testAnchorView, padding: 10, height: 30, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 40, width: 920, height: 30))

        testAnchorView.anchorInCorner(.topRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillWidth(align: .toTheLeftMatchingTop, relativeTo: testAnchorView, padding: 10, height: 30, offset: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 30, width: 920, height: 30))

        testSiblingView.alignAndFillWidth(align: .toTheLeftCentered, relativeTo: testAnchorView, padding: 20, height: 10, offset: 5)
        XCTAssert(testSiblingView.frame == CGRect(x: 20, y: 35, width: 900, height: 10))

        testSiblingView.alignAndFillWidth(align: .toTheLeftMatchingBottom, relativeTo: testAnchorView, padding: 15, height: 40, offset: 15)
        XCTAssert(testSiblingView.frame == CGRect(x: 15, y: 35, width: 910, height: 40))
    }

    func testAlignAndFillHeight() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .underMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 100)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 70, width: 100, height: 920))

        testSiblingView.alignAndFillHeight(align: .underCentered, relativeTo: testAnchorView, padding: 20, width: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 20, y: 80, width: 30, height: 900))

        testSiblingView.alignAndFillHeight(align: .underMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 20, y: 70, width: 40, height: 920))

        testAnchorView.anchorInCorner(.bottomRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .aboveMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 950, y: 10, width: 40, height: 920))

        testSiblingView.alignAndFillHeight(align: .aboveCentered, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 945, y: 10, width: 40, height: 920))

        testSiblingView.alignAndFillHeight(align: .aboveMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 940, y: 10, width: 40, height: 920))
    }

    func testAlignAndFillHeightWithOffset() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .underMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 100, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 20, y: 70, width: 100, height: 920))

        testSiblingView.alignAndFillHeight(align: .underCentered, relativeTo: testAnchorView, padding: 20, width: 30, offset: 15)
        XCTAssert(testSiblingView.frame == CGRect(x: 35, y: 80, width: 30, height: 900))

        testSiblingView.alignAndFillHeight(align: .underMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40, offset: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 40, y: 70, width: 40, height: 920))

        testAnchorView.anchorInCorner(.bottomRight, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFillHeight(align: .aboveMatchingRight, relativeTo: testAnchorView, padding: 10, width: 40, offset: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 980, y: 10, width: 40, height: 920))

        testSiblingView.alignAndFillHeight(align: .aboveCentered, relativeTo: testAnchorView, padding: 10, width: 40, offset: -10)
        XCTAssert(testSiblingView.frame == CGRect(x: 935, y: 10, width: 40, height: 920))

        testSiblingView.alignAndFillHeight(align: .aboveMatchingLeft, relativeTo: testAnchorView, padding: 10, width: 40, offset: -20)
        XCTAssert(testSiblingView.frame == CGRect(x: 920, y: 10, width: 40, height: 920))
    }

    func testAlignAndFill() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightMatchingTop, relativeTo: testAnchorView, padding: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 10, width: 920, height: 980))

        testAnchorView.anchorToEdge(.left, padding: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 10, width: 920, height: 980))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 10, width: 920, height: 980))
    }

    func testAlignAndFillWithOffset() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightMatchingTop, relativeTo: testAnchorView, padding: 10, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 20, width: 920, height: 970))

        testAnchorView.anchorToEdge(.left, padding: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10, offset: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 30, width: 920, height: 980))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 10, yPad: 10, width: 50, height: 50)

        testSiblingView.alignAndFill(align: .toTheRightCentered, relativeTo: testAnchorView, padding: 10, offset: -20)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: -10, width: 920, height: 980))
    }

    func testAlignBetweenHorizontal() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 50, height: 50)
        testAnchorView2.anchorInCorner(.topRight, xPad: 0, yPad: 0, width: 50, height: 50)

        testSiblingView.alignBetweenHorizontal(align: .toTheRightMatchingTop, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, height: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 60, y: 0, width: 880, height: 40))

        testSiblingView.alignBetweenHorizontal(align: .toTheRightCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 20, height: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 20, width: 860, height: 10))

        testSiblingView.alignBetweenHorizontal(align: .toTheRightMatchingBottom, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 5, height: 40)
        XCTAssert(testSiblingView.frame == CGRect(x: 55, y: 10, width: 890, height: 40))
    }

    func testAlignBetweenHorizontalWithOffset() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 50, height: 50)
        testAnchorView2.anchorInCorner(.topRight, xPad: 0, yPad: 0, width: 50, height: 50)

        testSiblingView.alignBetweenHorizontal(align: .toTheRightMatchingTop, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, height: 40, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 60, y: 10, width: 880, height: 40))

        testSiblingView.alignBetweenHorizontal(align: .toTheRightCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 20, height: 10, offset: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 70, y: 40, width: 860, height: 10))

        testSiblingView.alignBetweenHorizontal(align: .toTheRightMatchingBottom, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 5, height: 40, offset: -10)
        XCTAssert(testSiblingView.frame == CGRect(x: 55, y: 0, width: 890, height: 40))
    }

    func testAlignBetweenVertical() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testAnchorView2.anchorInCorner(.bottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSiblingView.alignBetweenVertical(align: .underMatchingLeft, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, width: 50)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 110, width: 50, height: 780))

        testSiblingView.alignBetweenVertical(align: .underCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 15, width: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 35, y: 115, width: 30, height: 770))

        testSiblingView.alignBetweenVertical(align: .underMatchingRight, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 3, width: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 90, y: 103, width: 10, height: 794))
    }

    func testAlignBetweenVerticalWithOffset() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testAnchorView2.anchorInCorner(.bottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSiblingView.alignBetweenVertical(align: .underMatchingLeft, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 10, width: 50, offset: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 110, width: 50, height: 780))

        testSiblingView.alignBetweenVertical(align: .underCentered, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 15, width: 30, offset: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 55, y: 115, width: 30, height: 770))

        testSiblingView.alignBetweenVertical(align: .underMatchingRight, primaryView: testAnchorView, secondaryView: testAnchorView2, padding: 3, width: 10, offset: -10)
        XCTAssert(testSiblingView.frame == CGRect(x: 80, y: 103, width: 10, height: 794))
    }

    func testGroupInCenter() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testAnchorView.groupInCenter(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView2.frame == CGRect(x: 15, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 40, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView4.frame == CGRect(x: 65, y: 40, width: 20, height: 20))

        testAnchorView.groupInCenter(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView2.frame == CGRect(x: 40, y: 15, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 40, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView4.frame == CGRect(x: 40, y: 65, width: 20, height: 20))
    }

    func testGroupInCornerHorizontal() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupInCorner(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .topLeft, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 50, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 90, y: 10, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .topRight, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 380, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 420, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 460, y: 10, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .bottomLeft, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 460, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 50, y: 460, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 90, y: 460, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .bottomRight, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 380, y: 460, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 420, y: 460, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 460, y: 460, width: 30, height: 30))
    }

    func testGroupInCornerVertical() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupInCorner(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .topLeft, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 10, y: 50, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 10, y: 90, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .topRight, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 460, y: 10, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 460, y: 50, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 460, y: 90, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .bottomLeft, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 380, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 10, y: 420, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 10, y: 460, width: 30, height: 30))

        testAnchorView.groupInCorner(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], inCorner: .bottomRight, padding: 10, width: 30, height: 30)
        XCTAssert(testSiblingView2.frame == CGRect(x: 460, y: 380, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 460, y: 420, width: 30, height: 30))
        XCTAssert(testSiblingView4.frame == CGRect(x: 460, y: 460, width: 30, height: 30))
    }

    func testGroupAgainstEdgeHorizontal() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupAgainstEdge(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .top, padding: 5, width: 40, height: 40)
        XCTAssert(testSiblingView2.frame == CGRect(x: 185, y: 5, width: 40, height: 40))
        XCTAssert(testSiblingView3.frame == CGRect(x: 230, y: 5, width: 40, height: 40))
        XCTAssert(testSiblingView4.frame == CGRect(x: 275, y: 5, width: 40, height: 40))

        testAnchorView.groupAgainstEdge(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .left, padding: 5, width: 40, height: 40)
        XCTAssert(testSiblingView2.frame == CGRect(x: 5, y: 230, width: 40, height: 40))
        XCTAssert(testSiblingView3.frame == CGRect(x: 50, y: 230, width: 40, height: 40))
        XCTAssert(testSiblingView4.frame == CGRect(x: 95, y: 230, width: 40, height: 40))

        testAnchorView.groupAgainstEdge(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .bottom, padding: 5, width: 40, height: 40)
        XCTAssert(testSiblingView2.frame == CGRect(x: 185, y: 455, width: 40, height: 40))
        XCTAssert(testSiblingView3.frame == CGRect(x: 230, y: 455, width: 40, height: 40))
        XCTAssert(testSiblingView4.frame == CGRect(x: 275, y: 455, width: 40, height: 40))

        testAnchorView.groupAgainstEdge(group: .horizontal, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .right, padding: 5, width: 40, height: 40)
        XCTAssert(testSiblingView2.frame == CGRect(x: 365, y: 230, width: 40, height: 40))
        XCTAssert(testSiblingView3.frame == CGRect(x: 410, y: 230, width: 40, height: 40))
        XCTAssert(testSiblingView4.frame == CGRect(x: 455, y: 230, width: 40, height: 40))
    }

    func testGroupAgainstEdgeVertical() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 500, height: 500)

        testAnchorView.groupAgainstEdge(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .top, padding: 10, width: 60, height: 60)
        XCTAssert(testSiblingView2.frame == CGRect(x: 220, y: 10, width: 60, height: 60))
        XCTAssert(testSiblingView3.frame == CGRect(x: 220, y: 80, width: 60, height: 60))
        XCTAssert(testSiblingView4.frame == CGRect(x: 220, y: 150, width: 60, height: 60))

        testAnchorView.groupAgainstEdge(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .left, padding: 10, width: 60, height: 60)
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 150, width: 60, height: 60))
        XCTAssert(testSiblingView3.frame == CGRect(x: 10, y: 220, width: 60, height: 60))
        XCTAssert(testSiblingView4.frame == CGRect(x: 10, y: 290, width: 60, height: 60))

        testAnchorView.groupAgainstEdge(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .bottom, padding: 10, width: 60, height: 60)
        XCTAssert(testSiblingView2.frame == CGRect(x: 220, y: 290, width: 60, height: 60))
        XCTAssert(testSiblingView3.frame == CGRect(x: 220, y: 360, width: 60, height: 60))
        XCTAssert(testSiblingView4.frame == CGRect(x: 220, y: 430, width: 60, height: 60))

        testAnchorView.groupAgainstEdge(group: .vertical, views: [testSiblingView2, testSiblingView3, testSiblingView4], againstEdge: .right, padding: 10, width: 60, height: 60)
        XCTAssert(testSiblingView2.frame == CGRect(x: 430, y: 150, width: 60, height: 60))
        XCTAssert(testSiblingView3.frame == CGRect(x: 430, y: 220, width: 60, height: 60))
        XCTAssert(testSiblingView4.frame == CGRect(x: 430, y: 290, width: 60, height: 60))
    }

    func testGroupAndAlignHorizontal() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 130, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 155, y: 0, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 130, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 155, y: 40, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 80, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 130, y: 80, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 155, y: 80, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .underMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 25, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 50, y: 105, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .underCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 15, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 40, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 65, y: 105, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .underMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 30, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 55, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 80, y: 105, width: 20, height: 20))

        testAnchorView.anchorInCorner(.topRight, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 825, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 850, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 0, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 825, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 850, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 40, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .toTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 825, y: 80, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 850, y: 80, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 80, width: 20, height: 20))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .aboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 865, width: 30, height: 30))
        XCTAssert(testSiblingView2.frame == CGRect(x: 35, y: 865, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 70, y: 865, width: 30, height: 30))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .aboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 30, height: 30)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 865, width: 30, height: 30))
        XCTAssert(testSiblingView2.frame == CGRect(x: 35, y: 865, width: 30, height: 30))
        XCTAssert(testSiblingView3.frame == CGRect(x: 70, y: 865, width: 30, height: 30))

        testSuperview.groupAndAlign(group: .horizontal, andAlign: .aboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 30, y: 875, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 55, y: 875, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 80, y: 875, width: 20, height: 20))
    }

    func testGroupAndAlignVertical() {
        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheRightMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 105, y: 25, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 105, y: 50, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheRightCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 15, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 105, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 105, y: 65, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheRightMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 105, y: 30, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 105, y: 55, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 105, y: 80, width: 20, height: 20))

        testAnchorView.anchorInCorner(.topRight, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheLeftMatchingTop, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 875, y: 0, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 875, y: 25, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 50, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheLeftCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 875, y: 15, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 875, y: 40, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 65, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .toTheLeftMatchingBottom, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 875, y: 30, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 875, y: 55, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 875, y: 80, width: 20, height: 20))

        testAnchorView.anchorInCorner(.topLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .vertical, andAlign: .underMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 0, y: 130, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 0, y: 155, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .underCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 40, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 40, y: 130, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 40, y: 155, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .underMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 80, y: 105, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 80, y: 130, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 80, y: 155, width: 20, height: 20))

        testAnchorView.anchorInCorner(.bottomLeft, xPad: 0, yPad: 0, width: 100, height: 100)

        testSuperview.groupAndAlign(group: .vertical, andAlign: .aboveMatchingLeft, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 0, y: 825, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 0, y: 850, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 0, y: 875, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .aboveCentered, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 40, y: 825, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 40, y: 850, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 40, y: 875, width: 20, height: 20))

        testSuperview.groupAndAlign(group: .vertical, andAlign: .aboveMatchingRight, views: [testSiblingView, testSiblingView2, testSiblingView3], relativeTo: testAnchorView, padding: 5, width: 20, height: 20)
        XCTAssert(testSiblingView.frame == CGRect(x: 80, y: 825, width: 20, height: 20))
        XCTAssert(testSiblingView2.frame == CGRect(x: 80, y: 850, width: 20, height: 20))
        XCTAssert(testSiblingView3.frame == CGRect(x: 80, y: 875, width: 20, height: 20))
    }

    func testGroupAndFill() {
        testSuperview.addSubview(testSiblingView2)
        testSuperview.addSubview(testSiblingView3)
        testSuperview.addSubview(testSiblingView4)

        testSuperview.groupAndFill(group: .horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 10, width: 320, height: 980))
        XCTAssert(testSiblingView2.frame == CGRect(x: 340, y: 10, width: 320, height: 980))
        XCTAssert(testSiblingView3.frame == CGRect(x: 670, y: 10, width: 320, height: 980))

        testSuperview.groupAndFill(group: .horizontal, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
        XCTAssert(testSiblingView.frame == CGRect(x: 2, y: 2, width: 247.5, height: 996))
        XCTAssert(testSiblingView2.frame == CGRect(x: 251.5, y: 2, width: 247.5, height: 996))
        XCTAssert(testSiblingView3.frame == CGRect(x: 501, y: 2, width: 247.5, height: 996))
        XCTAssert(testSiblingView4.frame == CGRect(x: 750.5, y: 2, width: 247.5, height: 996))

        testSuperview.groupAndFill(group: .vertical, views: [testSiblingView, testSiblingView2, testSiblingView3], padding: 10)
        XCTAssert(testSiblingView.frame == CGRect(x: 10, y: 10, width: 980, height: 320))
        XCTAssert(testSiblingView2.frame == CGRect(x: 10, y: 340, width: 980, height: 320))
        XCTAssert(testSiblingView3.frame == CGRect(x: 10, y: 670, width: 980, height: 320))

        testSuperview.groupAndFill(group: .vertical, views: [testSiblingView, testSiblingView2, testSiblingView3, testSiblingView4], padding: 2)
        XCTAssert(testSiblingView.frame == CGRect(x: 2, y: 2, width: 996, height: 247.5))
        XCTAssert(testSiblingView2.frame == CGRect(x: 2, y: 251.5, width: 996, height: 247.5))
        XCTAssert(testSiblingView3.frame == CGRect(x: 2, y: 501, width: 996, height: 247.5))
        XCTAssert(testSiblingView4.frame == CGRect(x: 2, y: 750.5, width: 996, height: 247.5))
    }
}
