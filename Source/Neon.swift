//
//  Neon.swift
//  Neon
//
//  Created by Mike on 9/16/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit

extension UIView {


    // MARK: Frame shortcuts
    //

    /// Get the x origin of a view.
    ///
    /// - returns: The minimum x value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.x() // returns 10.0
    ///
    func x() -> CGFloat {
        return CGRectGetMinX(frame)
    }


    /// Get the mid x of a view.
    ///
    /// - returns: The middle x value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.midX() // returns 7.5
    ///
    func xMid() -> CGFloat {
        return CGRectGetMinX(frame) + (CGRectGetWidth(frame) / 2.0)
    }


    /// Get the max x of a view.
    ///
    /// - returns: The maximum x value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.maxX() // returns 15.0
    ///
    func xMax() -> CGFloat {
        return CGRectGetMaxX(frame)
    }


    /// Get the y origin of a view.
    ///
    /// - returns: The minimum y value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.y() // returns 20.0
    ///
    func y() -> CGFloat {
        return CGRectGetMinY(frame)
    }


    /// Get the mid y of a view.
    ///
    /// - returns: The middle y value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.midY() // returns 13.5
    ///
    func yMid() -> CGFloat {
        return CGRectGetMinY(frame) + (CGRectGetHeight(frame) / 2.0)
    }


    /// Get the max y of a view.
    ///
    /// - returns: The maximum y value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.maxY() // returns 27.0
    ///
    func yMax() -> CGFloat {
        return CGRectGetMaxY(frame)
    }


    /// Get the width of a view.
    ///
    /// - returns: The width of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.width() // returns 5.0
    ///
    func width() -> CGFloat {
        return CGRectGetWidth(frame)
    }


    /// Get the height of a view.
    ///
    /// - returns: The height of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.height() // returns 7.0
    ///
    func height() -> CGFloat {
        return CGRectGetHeight(frame)
    }


    // MARK: Corner
    //
    ///
    /// Specifies a corner of a frame.
    ///
    /// ----
    /// **TopLeft**: The upper-left corner of the frame.
    ///
    /// ----
    /// **TopRight**: The upper-right corner of the frame.
    ///
    /// ----
    /// **BottomLeft**: The bottom-left corner of the frame.
    ///
    /// ----
    /// **BottomRight**: The upper-right corner of the frame.
    ///
    /// ----
    enum Corner {
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }


    // MARK: Edge
    //
    ///
    /// Specifies an edge, or face, of a frame.
    ///
    /// ----
    /// **Top**: The top edge of the frame.
    ///
    /// ----
    /// **Left**: The left edge of the frame.
    ///
    /// ----
    /// **Bottom**: The bottom edge of the frame.
    ///
    /// ----
    /// **Right**: The right edge of the frame.
    ///
    /// ----
    ///
    enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }


    // MARK: Align Type
    //
    ///
    /// Specifies how a view will be aligned relative to the sibling view.
    ///
    /// ----
    /// **ToTheRightMatchingTop**: Specifies that the view should be aligned to the right of a sibling, matching the
    /// top, or y origin, of the sibling's frame.
    ///
    /// ----
    /// **ToTheRightMatchingBottom**: Specifies that the view should be aligned to the right of a sibling, matching
    /// the bottom, or max y value, of the sibling's frame.
    ///
    /// ----
    /// **ToTheRightCentered**: Specifies that the view should be aligned to the right of a sibling, and will be centered
    /// to either match the vertical center of the sibling's frame or centered vertically within the superview, depending
    /// on the context.
    ///
    /// ----
    /// **ToTheLeftMatchingTop**: Specifies that the view should be aligned to the left of a sibling, matching the top,
    /// or y origin, of the sibling's frame.
    ///
    /// ----
    /// **ToTheLeftMatchingBottom**: Specifies that the view should be aligned to the left of a sibling, matching the
    /// bottom, or max y value, of the sibling's frame.
    ///
    /// ----
    /// **ToTheLeftCentered**: Specifies that the view should be aligned to the left of a sibling, and will be centered
    /// to either match the vertical center of the sibling's frame or centered vertically within the superview, depending
    /// on the context.
    ///
    /// ---
    /// **UnderMatchingLeft**: Specifies that the view should be aligned under a sibling, matching the left, or x origin,
    /// of the sibling's frame.
    ///
    /// ----
    /// **UnderMatchingRight**: Specifies that the view should be aligned under a sibling, matching the right, or max y
    /// of the sibling's frame.
    ///
    /// ----
    /// **UnderCentered**: Specifies that the view should be aligned under a sibling, and will be centered to either match
    /// the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
    ///
    /// ----
    /// **AboveMatchingLeft**: Specifies that the view should be aligned above a sibling, matching the left, or x origin
    /// of the sibling's frame.
    ///
    /// ----
    /// **AboveMatchingRight**: Specifies that the view should be aligned above a sibling, matching the right, or max x
    /// of the sibling's frame.
    ///
    /// ----
    /// **AboveCentered**: Specifies that the view should be aligned above a sibling, and will be centered to either match
    /// the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
    ///
    /// ----
    ///
    enum Align {
        case ToTheRightMatchingTop
        case ToTheRightMatchingBottom
        case ToTheRightCentered
        case ToTheLeftMatchingTop
        case ToTheLeftMatchingBottom
        case ToTheLeftCentered
        case UnderMatchingLeft
        case UnderMatchingRight
        case UnderCentered
        case AboveMatchingLeft
        case AboveMatchingRight
        case AboveCentered
    }


    // MARK: Group Type
    //
    ///
    /// Specifies how a group will be laid out.
    ///
    /// ----
    /// **Horizontal**: Specifies that the views should be aligned relative to to eachother horizontally.
    ///
    /// ----
    /// **Vertical**: Specifies that the views should be aligned relative to eachother vertically.
    ///
    /// ----
    ///
    enum Group {
        case Horizontal
        case Vertical
    }


    // MARK: Filling superview
    //

    /// Fill the superview, with optional padding values.
    ///
    /// - note: If you don't want padding, simply call `fillSuperview()` with no parameters.
    ///
    /// - parameters:
    ///   - left: The padding between the left side of the view and the superview.
    ///
    ///   - right: The padding between the right side of the view and the superview.
    ///
    ///   - top: The padding between the top of the view and the superview.
    ///
    ///   - bottom: The padding between the bottom of the view and the superview.
    ///
    func fillSuperview(left left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
        if superview == nil {
            print("[NEON] Warning: Can't anchor view without superview!")
            return
        }

        let width : CGFloat = superview!.width() - (left + right)
        let height : CGFloat = superview!.height() - (top + bottom)

        frame = CGRectMake(left, top, width, height)
    }


    // MARK: Anchoring in superview
    //

    /// Anchor a view in the center of its superview.
    ///
    /// - parameters:
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    func anchorInCenter(width width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't anchor view without superview!")
            return
        }

        let xOrigin : CGFloat = (superview!.width() / 2.0) - (width / 2.0)
        let yOrigin : CGFloat = (superview!.height() / 2.0) - (height / 2.0)

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Anchor a view in one of the four corners of its superview.
    ///
    /// - parameters:
    ///   - corner: The `CornerType` value used to specify in which corner the view will be anchored.
    ///
    ///   - xPad: The *horizontal* padding applied to the view inside its superview, which can be applied
    /// to the left or right side of the view, depending upon the `CornerType` specified.
    ///
    ///   - yPad: The *vertical* padding applied to the view inside its supeview, which will either be on
    /// the top or bottom of the view, depending upon the `CornerType` specified.
    ///
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    func anchorInCorner(corner: Corner, xPad: CGFloat, yPad: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't anchor view without superview!")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch corner {
        case .TopLeft:
            xOrigin = xPad
            yOrigin = yPad

        case .BottomLeft:
            xOrigin = xPad
            yOrigin = superview!.height() - height - yPad

        case .TopRight:
            xOrigin = superview!.width() - width - xPad
            yOrigin = yPad

        case .BottomRight:
            xOrigin = superview!.width() - width - xPad
            yOrigin = superview!.height() - height - yPad
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Anchor a view in its superview, centered on a given edge.
    ///
    /// - parameters:
    ///   - edge: The `Edge` used to specify which face of the superview the view
    /// will be anchored against and centered relative to.
    ///
    ///   - padding: The padding applied to the view inside its superview. How this padding is applied
    /// will vary depending on the `Edge` provided. Views centered against the top or bottom of
    /// their superview will have the padding applied above or below them respectively, whereas views 
    /// centered against the left or right side of their superview will have the padding applied to the
    /// right and left sides respectively.
    ///
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    func anchorToEdge(edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't anchor view without superview!")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch edge {
        case .Top:
            xOrigin = (superview!.width() / 2.0) - (width / 2.0)
            yOrigin = padding

        case .Left:
            xOrigin = padding
            yOrigin = (superview!.height() / 2.0) - (height / 2.0)

        case .Bottom:
            xOrigin = (superview!.width() / 2.0) - (width / 2.0)
            yOrigin = superview!.height() - height - padding

        case .Right:
            xOrigin = superview!.width() - width - padding
            yOrigin = (superview!.height() / 2.0) - (height / 2.0)
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Anchor a view in its superview, centered on a given edge and filling either the width or
    /// height of that edge. For example, views anchored to the `.Top` or `.Bottom` will have
    /// their widths automatically sized to fill their superview, with the xPad applied to both
    /// the left and right sides of the view.
    ///
    /// - parameters:
    ///   - edge: The `Edge` used to specify which face of the superview the view
    /// will be anchored against, centered relative to, and expanded to fill.
    ///
    ///   - xPad: The horizontal padding applied to the view inside its superview. If the `Edge`
    /// specified is `.Top` or `.Bottom`, this padding will be applied to the left and right sides
    /// of the view when it fills the width superview.
    ///
    ///   - yPad: The vertical padding applied to the view inside its superview. If the `Edge`
    /// specified is `.Left` or `.Right`, this padding will be applied to the top and bottom sides
    /// of the view when it fills the height of the superview.
    ///
    ///   - otherSize: The size parameter that is *not automatically calculated* based on the provided
    /// edge. For example, views anchored to the `.Top` or `.Bottom` will have their widths automatically
    /// calculated, so `otherSize` will be applied to their height, and subsequently views anchored to
    /// the `.Left` and `.Right` will have `otherSize` applied to their width as their heights are
    /// automatically calculated.
    ///
    func anchorAndFillEdge(edge: Edge, xPad: CGFloat, yPad: CGFloat, otherSize: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't anchor view without superview!")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch edge {
        case .Top:
            xOrigin = xPad
            yOrigin = yPad
            width = superview!.width() - (2 * xPad)
            height = otherSize

        case .Left:
            xOrigin = xPad
            yOrigin = yPad
            width = otherSize
            height = superview!.height() - (2 * yPad)

        case .Bottom:
            xOrigin = xPad
            yOrigin = superview!.height() - otherSize - yPad
            width = superview!.width() - (2 * xPad)
            height = otherSize

        case .Right:
            xOrigin = superview!.width() - otherSize - xPad
            yOrigin = yPad
            width = otherSize
            height = superview!.height() - (2 * yPad)
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    // MARK: Align relative to sibling views
    //

    /// Align a view relative to a sibling view in the same superview.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with its sibling.
    ///
    ///   - relativeTo: The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares
    /// the same superview as this view, and that the sibling view is not the same as this view, otherwise a
    /// `fatalError` is thrown.
    ///
    ///   - padding: The padding to be applied between this view and the sibling view, which is applied differently
    /// depending on the `Align` specified. For example, if aligning `.ToTheRightOfMatchingTop` the padding is used
    /// to adjust the x origin of this view so it sits to the right of the sibling view, while the y origin is
    /// automatically calculated to match the sibling view.
    ///
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    func align(align: Align, relativeTo sibling: UIView, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }
        
        if self == sibling {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != sibling.superview {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.y()
            break

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMax() - height
            break

        case .ToTheRightCentered:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMid() - (height / 2.0)
            break

        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x() - width - padding
            yOrigin = sibling.y()
            break

        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x() - width - padding
            yOrigin = sibling.yMax() - height
            break

        case .ToTheLeftCentered:
            xOrigin = sibling.x() - width - padding
            yOrigin = sibling.yMid() - (height / 2.0)
            break

        case .UnderMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.yMax() + padding
            break

        case .UnderMatchingRight:
            xOrigin = sibling.yMax() - width
            yOrigin = sibling.yMax() + padding
            break

        case .UnderCentered:
            xOrigin = sibling.xMid() - (width / 2.0)
            yOrigin = sibling.yMax() + padding
            break

        case .AboveMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.y() - padding - height
            break

        case .AboveMatchingRight:
            xOrigin = sibling.yMax() - width
            yOrigin = sibling.y() - padding - height
            break

        case .AboveCentered:
            xOrigin = sibling.xMid() - (width / 2.0)
            yOrigin = sibling.y() - padding - height
            break
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }



    /// Align a view relative to a sibling view in the same superview, and automatically expand the width to fill
    /// the superview with equal padding between the superview and sibling view.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with its sibling.
    ///
    ///   - relativeTo: The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares
    /// the same superview as this view, and that the sibling view is not the same as this view, otherwise a
    /// `fatalError` is thrown.
    ///
    ///   - padding: The padding to be applied between this view, the sibling view and the superview.
    ///
    ///   - height: The height of the view.
    ///
    func alignAndFillWidth(align align: Align, relativeTo sibling: UIView, padding: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }

        if self == sibling {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != sibling.superview {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        let superviewWidth = superview!.width()
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.y()
            width = superviewWidth - xOrigin - padding
            break

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMax() - height
            width = superviewWidth - xOrigin - padding
            break

        case .ToTheRightCentered:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMid() - (height / 2.0)
            width = superviewWidth - xOrigin - padding
            break

        case .ToTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y()
            width = sibling.x() - (2 * padding)
            break

        case .ToTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = sibling.yMax() - height
            width = sibling.x() - (2 * padding)
            break

        case .ToTheLeftCentered:
            xOrigin = padding
            yOrigin = sibling.yMid() - (height / 2.0)
            width = sibling.x() - (2 * padding)
            break

        case .UnderMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - xOrigin - padding
            break

        case .UnderMatchingRight:
            xOrigin = padding
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - (superviewWidth - sibling.xMax()) - padding
            break

        case .UnderCentered:
            xOrigin = padding
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - (2 * padding)
            break

        case .AboveMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.y() - padding - height
            width = superviewWidth - xOrigin - padding
            break

        case .AboveMatchingRight:
            xOrigin = padding
            yOrigin = sibling.y() - padding - height
            width = superviewWidth - (superviewWidth - sibling.xMax()) - padding
            break

        case .AboveCentered:
            xOrigin = padding
            yOrigin = sibling.y() - padding - height
            width = superviewWidth - (2 * padding)
            break
        }

        if width < 0.0 {
            width = 0.0
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Align a view relative to a sibling view in the same superview, and automatically expand the height to fill
    /// the superview with equal padding between the superview and sibling view.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with its sibling.
    ///
    ///   - relativeTo: The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares
    /// the same superview as this view, and that the sibling view is not the same as this view, otherwise a
    /// `fatalError` is thrown.
    ///
    ///   - padding: The padding to be applied between this view, the sibling view and the superview.
    ///
    ///   - width: The width of the view.
    ///
    func alignAndFillHeight(align align: Align, relativeTo sibling: UIView, padding: CGFloat, width: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }

        if self == sibling {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != sibling.superview {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        let superviewHeight = superview!.height()
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.y()
            height = superviewHeight - sibling.y() - padding
            break

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax() + padding
            yOrigin = padding
            height = superviewHeight - (superviewHeight - sibling.yMax()) - padding
            break

        case .ToTheRightCentered:
            xOrigin = sibling.xMax() + padding
            yOrigin = padding
            height = superviewHeight - (2 * padding)
            break

        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x() - width - padding
            yOrigin = sibling.y()
            height = superviewHeight - sibling.y() - padding
            break

        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x() - width - padding
            yOrigin = padding
            height = superviewHeight - (superviewHeight - sibling.yMax()) - padding
            break

        case .ToTheLeftCentered:
            xOrigin = sibling.x() - width - padding
            yOrigin = padding
            height = superviewHeight - (2 * padding)
            break

        case .UnderMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.yMax() + padding
            height = superviewHeight - yOrigin - padding
            break

        case .UnderMatchingRight:
            xOrigin = sibling.xMax() - width
            yOrigin = sibling.yMax() + padding
            height = superviewHeight - yOrigin - padding
            break

        case .UnderCentered:
            xOrigin = sibling.xMid() - (width / 2.0)
            yOrigin = sibling.yMax() + padding
            height = superviewHeight - yOrigin - padding
            break

        case .AboveMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = padding
            height = sibling.y() - (2 * padding)
            break

        case .AboveMatchingRight:
            xOrigin = sibling.xMax() - width
            yOrigin = padding
            height = sibling.y() - (2 * padding)
            break

        case .AboveCentered:
            xOrigin = sibling.xMid() - (width / 2.0)
            yOrigin = padding
            height = sibling.y() - (2 * padding)
            break
        }

        if height < 0.0 {
            height = 0.0
        }
        
        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Align a view relative to a sibling view in the same superview, and automatically expand the width AND height
    /// to fill the superview with equal padding between the superview and sibling view.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with its sibling.
    ///
    ///   - relativeTo: The sibling view this view will be aligned relative to. **NOTE:** Ensure this sibling view shares
    /// the same superview as this view, and that the sibling view is not the same as this view, otherwise a
    /// `fatalError` is thrown.
    ///
    ///   - padding: The padding to be applied between this view, the sibling view and the superview.
    ///
    func alignAndFill(align align: Align, relativeTo sibling: UIView, padding: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }

        if self == sibling {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != sibling.superview {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        let superviewWidth = superview!.width()
        let superviewHeight = superview!.height()
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.y()
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding
            break

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax() + padding
            yOrigin = padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.yMax()) - padding
            break

        case .ToTheRightCentered:
            xOrigin = sibling.xMax() + padding
            yOrigin = padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (2 * padding)
            break

        case .ToTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y()
            width = superviewWidth - (superviewWidth - sibling.x()) - (2 * padding)
            height = superviewHeight - yOrigin - padding
            break

        case .ToTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = padding
            width = superviewWidth - (superviewWidth - sibling.x()) - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.yMax()) - padding
            break

        case .ToTheLeftCentered:
            xOrigin = padding
            yOrigin = padding
            width = superviewWidth - (superviewWidth - sibling.x()) - (2 * padding)
            height = superviewHeight - (2 * padding)
            break

        case .UnderMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding
            break

        case .UnderMatchingRight:
            xOrigin = padding
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - (superviewWidth - sibling.xMax()) - padding
            height = superviewHeight - yOrigin - padding
            break

        case .UnderCentered:
            xOrigin = padding
            yOrigin = sibling.yMax() + padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - yOrigin - padding
            break

        case .AboveMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.y()) - (2 * padding)
            break

        case .AboveMatchingRight:
            xOrigin = padding
            yOrigin = padding
            width = superviewWidth - (superviewWidth - sibling.xMax()) - padding
            height = superviewHeight - (superviewHeight - sibling.y()) - (2 * padding)
            break

        case .AboveCentered:
            xOrigin = padding
            yOrigin = padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.y()) - (2 * padding)
            break
        }

        if width < 0.0 {
            width = 0.0
        }

        if height < 0.0 {
            height = 0.0
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    // MARK: Align between siblings
    //

    /// Align a view between two sibling views horizontally, automatically expanding the width to extend the full
    /// span between the right side of the `leftView` and the left side of the `rightView`, with equal padding on
    /// both sides.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with the *left-most sibling*.
    /// This method assumes the view will be placed to the right of and aligned relative to the `leftView`, and as
    /// such the only allowable alignment types are `.ToTheRightMatchingTop`, `.ToTheRightMatchingBottom`, and 
    /// `.ToTheRightCentered`. Providing another `Align` type will result in a fatal error.
    ///
    ///   - leftView: The primary sibling view this view will be aligned to the right of.
    ///
    ///   - right: The secondary sibling view this view will be aligned to the left of.
    ///
    ///   - padding: The horizontal padding to be applied between this view and both sibling views.
    ///
    ///   - height: The height of the view.
    ///
    func alignBetweenHorizontal(align align: Align, leftView: UIView, rightView: UIView, padding: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }

        if self == leftView || self == rightView {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != leftView.superview || superview != rightView.superview  {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        let superviewWidth : CGFloat = superview!.width()
        let xOrigin : CGFloat = leftView.xMax() + padding
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = superviewWidth - leftView.xMax() - (superviewWidth - rightView.x()) - (2 * padding)

        switch align {
        case .ToTheRightMatchingTop:
            yOrigin = leftView.y()
            break

        case .ToTheRightMatchingBottom:
            yOrigin = leftView.yMax() - height
            break

        case .ToTheRightCentered:
            yOrigin = leftView.yMid() - (height / 2.0)
            break

        case .ToTheLeftMatchingTop, .ToTheLeftMatchingBottom, .ToTheLeftCentered, .UnderMatchingLeft, .UnderMatchingRight, .UnderCentered,  .AboveMatchingLeft, .AboveMatchingRight, .AboveCentered:
            fatalError("[NEON] Invalid Align specified for alignBetweenHorizonal(). Use .ToTheRightMatchingTop, .ToTheRightMatchingBottom, or .ToTheRightCentered instead.")
            break
        }

        if width < 0.0 {
            width = 0.0
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    /// Align a view between two sibling views vertically, automatically expanding the height to extend the full
    /// span between the bottom of the `topView` and the top of the `bottomView`, with equal padding above and below.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with the *top-most sibling*.
    /// This method assumes the view will be placed under and aligned relative to the `topView`, and as
    /// such the only allowable alignment types are `.UnderMatchingLeft`, `.UnderMatchingRight`, and `.UnderCentered`.
    /// Providing another `Align` type will result in a fatal error.
    ///
    ///   - topView: The primary sibling view this view will be aligned under.
    ///
    ///   - bottomView: The secondary sibling view this view will be aligned above.
    ///
    ///   - padding: The vertical padding to be applied between this view and both sibling views.
    ///
    ///   - width: The width of the view.
    ///
    func alignBetweenVertical(align align: Align, topView: UIView, bottomView: UIView, padding: CGFloat, width: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Can't align view without superview!")
            return
        }

        if self == topView || self == bottomView {
            fatalError("[NEON] Can't align view relative to itself!")
        }

        if superview != topView.superview || superview != bottomView.superview  {
            fatalError("[NEON] Can't align view relative to another view in a different superview!")
        }

        let superviewHeight : CGFloat = superview!.height()
        var xOrigin : CGFloat = 0.0
        let yOrigin : CGFloat = topView.yMax() + padding
        var height : CGFloat = superviewHeight - topView.yMax() - (superviewHeight - bottomView.y()) - (2 * padding)

        switch align {
        case .UnderMatchingLeft:
            xOrigin = topView.x()
            break

        case .UnderMatchingRight:
            xOrigin = topView.xMax() - width
            break

        case .UnderCentered:
            xOrigin = topView.xMid() - (width / 2.0)
            break

        case .ToTheLeftMatchingTop, .ToTheLeftMatchingBottom, .ToTheLeftCentered, .ToTheRightMatchingTop, .ToTheRightMatchingBottom, .ToTheRightCentered,  .AboveMatchingLeft, .AboveMatchingRight, .AboveCentered:
            fatalError("[NEON] Invalid Align specified for alignBetweenHorizonal(). Use .ToTheRightMatchingTop, .ToTheRightMatchingBottom, or .ToTheRightCentered instead.")
            break
        }

        if height < 0 {
            height = 0
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)
    }


    // MARK: Grouping siblings
    //

    /// Tell a view to group an array of its subviews in one of its corners, specifying the padding between each subview,
    /// as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically in the corner.
    ///
    ///   - views: The array of views to grouped in the specified corner. **NOTE:** The order of these views is important;
    /// the first view is the view placed in the specified `Corner`, and the other views are placed relative to this view,
    /// in order, so if grouping vertically in the lower-right corner, the first view in the array will be the bottom-most 
    /// subview, the second subview is placed above the first, etc.
    ///
    ///   - inCorner: The specified corner the views will be grouped in.
    ///
    ///   - padding: The padding to be applied between the subviews and their superview.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    func groupInCorner(group group: Group, views: [UIView], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Attempted to group subviews but view doesn't have a superview of its own.")
            return
        }

        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch group {
        case .Horizontal:
            xAdjust = width + padding
            break

        case .Vertical:
            yAdjust = height + padding
            break
        }

        switch corner {
        case .TopLeft:
            xOrigin = padding
            yOrigin = padding
            break

        case .TopRight:
            xOrigin = self.width() - width - padding
            yOrigin = padding
            xAdjust = -xAdjust
            break

        case .BottomLeft:
            xOrigin = padding
            yOrigin = self.height() - height - padding
            yAdjust = -yAdjust
            break

        case .BottomRight:
            xOrigin = self.width() - width - padding
            yOrigin = self.height() - height - padding
            xAdjust = -xAdjust
            yAdjust = -yAdjust
            break
        }

        for view in views {
            if view.superview != self {
                fatalError("[NEON] Can't group view that is a subview of another view!")
            }
            
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)
            
            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }


    /// Tell a view to group an array of its subviews centered, specifying the padding between each subview,
    /// as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically in the center.
    ///
    ///   - views: The array of views to grouped in the center. **NOTE:** Depending on if the views are gouped horizontally
    /// or vertically, they will be placed in order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - padding: The padding to be applied between the subviews.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    func groupInCenter(group group: Group, views: [UIView], padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Attempted to group subviews but view doesn't have a superview of its own.")
            return
        }

        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCenter().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch group {
        case .Horizontal:
            xOrigin = (self.width() - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = (self.height() / 2.0) - (height / 2.0)
            xAdjust = width + padding
            break

        case .Vertical:
            xOrigin = (self.width() / 2.0) - (width / 2.0)
            yOrigin = (self.height() - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
            yAdjust = height + padding
            break
        }

        for view in views {
            if view.superview != self {
                fatalError("[NEON] Can't group view that is a subview of another view!")
            }

            view.frame = CGRectMake(xOrigin, yOrigin, width, height)
            
            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }


    /// Tell a view to group an array of its subviews against one of its edges, specifying the padding between each subview
    /// and their superview, as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically against the specified 
    /// edge.
    ///
    ///   - views: The array of views to grouped in the specified corner. **NOTE:** The order of these views is important. If
    /// grouping the views horizontally, the views will be laid out from left-to-right ***unless*** the `.Right` edge is specified,
    /// in which case they would be laid out from right-t0-left.
    ///
    ///   - againstEdge: The specified edge the views will be grouped against.
    ///
    ///   - padding: The padding to be applied between the subviews and their superview.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    func groupAgainstEdge(group group: Group, views: [UIView], againstEdge edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Attempted to group subviews but view doesn't have a superview of its own.")
            return
        }

        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAgainstEdge().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch edge {
        case .Top:
            if group == .Horizontal {
                xOrigin = (self.width() - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                xAdjust = width + padding
            } else {
                xOrigin = (self.width() / 2.0) - (width / 2.0)
                yAdjust = height + padding
            }

            yOrigin = padding
            break

        case .Left:
            if group == .Horizontal {
                yOrigin = (self.height() / 2.0) - (height / 2.0)
                xAdjust = width + padding
            } else {
                yOrigin = (self.height() - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
                yAdjust = height + padding
            }

            xOrigin = padding
            break

        case .Bottom:
            if group == .Horizontal {
                xOrigin = (self.width() - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                xAdjust = width + padding
            } else {
                xOrigin = (self.width() / 2.0) - (width / 2.0)
                yAdjust = -(height + padding)
            }

            yOrigin = self.height() - height - padding
            break

        case .Right:
            if group == .Horizontal {
                yOrigin = (self.height() / 2.0) - (height / 2.0)
                xAdjust = -(width + padding)
            } else {
                yOrigin = (self.height() - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
                yAdjust = height + padding
            }

            xOrigin = self.width() - width - padding
            break
        }

        for view in views {
            if view.superview != self {
                fatalError("[NEON] Can't group view that is a subview of another view!")
            }

            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }

    func groupAndAlign(group group: Group, andAlign align: Align, views: [UIView], relativeTo sibling: UIView, padding: CGFloat, width: CGFloat, height: CGFloat) {
        switch group {
        case .Horizontal:
            groupAndAlignHorizontal(align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)
            break

        case .Vertical:
            groupAndAlignVertical(align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)
            break
        }
    }

    private func groupAndAlignHorizontal(align: Align, views: [UIView], relativeTo sibling: UIView, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Attempted to group subviews but view doesn't have a superview of its own.")
            return
        }

        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAgainstEdge().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = width + padding

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.y()
            break

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMax() - height
            break

        case .ToTheRightCentered:
            xOrigin = sibling.xMax() + padding
            yOrigin = sibling.yMid() - (height / 2.0)
            break

        case .ToTheLeftMatchingTop:
            xAdjust = -xAdjust
            break

        case .ToTheLeftMatchingBottom:
            xAdjust = -xAdjust
            break

        case .ToTheLeftCentered:
            xAdjust = -xAdjust
            break

        case .UnderMatchingLeft:
            xOrigin = sibling.x()
            yOrigin = sibling.yMax() + padding
            break

        case .UnderMatchingRight:
            break

        case .UnderCentered:
            break

        case .AboveMatchingLeft:
            break

        case .AboveMatchingRight:
            break

        case .AboveCentered:
            break
        }

        for view in views {
            if view.superview != self {
                fatalError("[NEON] Can't group view that is a subview of another view!")
            }
            
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)
            
            xOrigin += xAdjust
        }
    }

    private func groupAndAlignVertical(align: Align, views: [UIView], relativeTo sibling: UIView, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if superview == nil {
            print("[NEON] Warning: Attempted to group subviews but view doesn't have a superview of its own.")
            return
        }

        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAgainstEdge().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var yAdjust : CGFloat = height + padding

        switch align {
        case .ToTheRightMatchingTop:
            break

        case .ToTheRightMatchingBottom:
            break

        case .ToTheRightCentered:
            break

        case .ToTheLeftMatchingTop:
            break

        case .ToTheLeftMatchingBottom:
            break

        case .ToTheLeftCentered:
            break

        case .UnderMatchingLeft:
            break

        case .UnderMatchingRight:
            xOrigin = sibling.xMax() - width
            yOrigin = sibling.yMax() + padding
            break

        case .UnderCentered:
            break

        case .AboveMatchingLeft:
            break

        case .AboveMatchingRight:
            break

        case .AboveCentered:
            break
        }

        for view in views {
            if view.superview != self {
                fatalError("[NEON] Can't group view that is a subview of another view!")
            }
            
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            yOrigin += yAdjust
        }
    }


    // TODO: I think I can put pictures in documentation?
}