//
//  NeonAlignable.swift
//  Neon
//
//  Created by Mike on 10/1/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif


public protocol Alignable : Frameable {}

public extension Alignable {

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
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func align(_ align: Align, relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height + offset

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0) + offset

        case .toTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y + offset

        case .toTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMax - height + offset

        case .toTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMid - (height / 2.0) + offset

        case .underMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding

        case .underMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.yMax + padding

        case .underCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.yMax + padding

        case .aboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.y - padding - height

        case .aboveMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.y - padding - height

        case .aboveCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.y - padding - height
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.align(align, relativeTo: sibling, padding: padding, width: width, height: self.height, offset: offset)
        }
        if width == AutoWidth {
            self.setDimensionAutomatically()
            self.align(align, relativeTo: sibling, padding: padding, width: self.width, height: height, offset: offset)
        }
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
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func alignAndFillWidth(align: Align, relativeTo sibling: Frameable, padding: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        let superviewWidth = superFrame.width
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            width = superviewWidth - xOrigin - padding

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height + offset
            width = superviewWidth - xOrigin - padding

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            width = superviewWidth - xOrigin - padding

        case .toTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y + offset
            width = sibling.x - (2 * padding)

        case .toTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = sibling.yMax - height + offset
            width = sibling.x - (2 * padding)

        case .toTheLeftCentered:
            xOrigin = padding
            yOrigin = sibling.yMid - (height / 2.0) + offset
            width = sibling.x - (2 * padding)

        case .underMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - xOrigin - padding

        case .underMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding

        case .underCentered:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (2 * padding)

        case .aboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - xOrigin - padding

        case .aboveMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding

        case .aboveCentered:
            xOrigin = padding + offset
            yOrigin = sibling.y - padding - height
            width = superviewWidth - (2 * padding)
        }

        if width < 0.0 {
            width = 0.0
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.alignAndFillWidth(align: align, relativeTo: sibling, padding: padding, height: self.height, offset: offset)
        }
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
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func alignAndFillHeight(align: Align, relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, offset: CGFloat = 0) {
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            height = superviewHeight - sibling.y - padding

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            height = superviewHeight - (2 * padding)

        case .toTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y + offset
            height = superviewHeight - sibling.y - padding

        case .toTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = padding + offset
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding

        case .toTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = padding + offset
            height = superviewHeight - (2 * padding)

        case .underMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding

        case .underMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding

        case .underCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = sibling.yMax + padding
            height = superviewHeight - yOrigin - padding

        case .aboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)

        case .aboveMatchingRight:
            xOrigin = sibling.xMax - width + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)

        case .aboveCentered:
            xOrigin = sibling.xMid - (width / 2.0) + offset
            yOrigin = padding
            height = sibling.y - (2 * padding)
        }

        if height < 0.0 {
            height = 0.0
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.alignAndFillHeight(align: align, relativeTo: sibling, padding: padding, width: self.height, offset: offset)
        }
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
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func alignAndFill(align: Align, relativeTo sibling: Frameable, padding: CGFloat, offset: CGFloat = 0) {
        let superviewWidth : CGFloat = superFrame.width
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = padding + offset
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (2 * padding)

        case .toTheLeftMatchingTop:
            xOrigin = padding
            yOrigin = sibling.y + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - yOrigin - padding

        case .toTheLeftMatchingBottom:
            xOrigin = padding
            yOrigin = padding + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.yMax) - padding

        case .toTheLeftCentered:
            xOrigin = padding
            yOrigin = padding + offset
            width = superviewWidth - (superviewWidth - sibling.x) - (2 * padding)
            height = superviewHeight - (2 * padding)

        case .underMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - yOrigin - padding

        case .underMatchingRight:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            height = superviewHeight - yOrigin - padding

        case .underCentered:
            xOrigin = padding + offset
            yOrigin = sibling.yMax + padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - yOrigin - padding

        case .aboveMatchingLeft:
            xOrigin = sibling.x + offset
            yOrigin = padding
            width = superviewWidth - xOrigin - padding
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)

        case .aboveMatchingRight:
            xOrigin = padding + offset
            yOrigin = padding
            width = superviewWidth - (superviewWidth - sibling.xMax) - padding
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)

        case .aboveCentered:
            xOrigin = padding + offset
            yOrigin = padding
            width = superviewWidth - (2 * padding)
            height = superviewHeight - (superviewHeight - sibling.y) - (2 * padding)
        }

        if width < 0.0 {
            width = 0.0
        }

        if height < 0.0 {
            height = 0.0
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
    }


    /// Align a view between two sibling views horizontally, automatically expanding the width to extend the full
    /// horizontal span between the `primaryView` and the `secondaryView`, with equal padding on both sides.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with the primary view.
    ///
    ///   - primaryView: The primary sibling view this view will be aligned relative to.
    ///
    ///   - secondaryView: The secondary sibling view this view will be automatically sized to fill the space between.
    ///
    ///   - padding: The horizontal padding to be applied between this view and both sibling views.
    ///
    ///   - height: The height of the view.
    ///
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func alignBetweenHorizontal(align: Align, primaryView: Frameable, secondaryView: Frameable, padding: CGFloat, height: CGFloat, offset: CGFloat = 0) {
        let superviewWidth : CGFloat = superFrame.width
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.y + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)

        case .toTheRightMatchingBottom:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.yMax - height + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)

        case .toTheRightCentered:
            xOrigin = primaryView.xMax + padding
            yOrigin = primaryView.yMid - (height / 2.0) + offset
            width = superviewWidth - primaryView.xMax - (superviewWidth - secondaryView.x) - (2 * padding)

        case .toTheLeftMatchingTop:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.y + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)

        case .toTheLeftMatchingBottom:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.yMax - height + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)

        case .toTheLeftCentered:
            xOrigin = secondaryView.xMax + padding
            yOrigin = primaryView.yMid - (height / 2.0) + offset
            width = superviewWidth - secondaryView.xMax - (superviewWidth - primaryView.x) - (2 * padding)

        case .underMatchingLeft, .underMatchingRight, .underCentered,  .aboveMatchingLeft, .aboveMatchingRight, .aboveCentered:
            fatalError("[NEON] Invalid Align specified for alignBetweenHorizonal().")
        }

        if width < 0.0 {
            width = 0.0
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.alignBetweenHorizontal(align: align, primaryView: primaryView, secondaryView: secondaryView, padding: padding, height: self.height)
        }
    }


    /// Align a view between two sibling views vertically, automatically expanding the height to extend the full
    /// vertical span between the `primaryView` and the `secondaryView`, with equal padding above and below.
    ///
    /// - parameters:
    ///   - align: The `Align` type used to specify where and how this view is aligned with the primary view.
    ///
    ///   - primaryView: The primary sibling view this view will be aligned relative to.
    ///
    ///   - secondaryView: The secondary sibling view this view will be automatically sized to fill the space between.
    ///
    ///   - padding: The horizontal padding to be applied between this view and both sibling views.
    ///
    ///   - width: The width of the view.
    ///
    ///   - offset: An optional parameter that will offset the view by the defined amount such that the view will not perfectly
    /// match the specified `Align`. For example, if you specify `.ToTheRightMatchingTop` and provide an offset value of `5`, the
    /// view's y origin will be lower than the sibling view's y origin by 5 points.
    ///
    public func alignBetweenVertical(align: Align, primaryView: Frameable, secondaryView: Frameable, padding: CGFloat, width: CGFloat, offset: CGFloat = 0) {
        let superviewHeight : CGFloat = superFrame.height
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var height : CGFloat = 0.0

        switch align {
        case .underMatchingLeft:
            xOrigin = primaryView.x + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)

        case .underMatchingRight:
            xOrigin = primaryView.xMax - width + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)

        case .underCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset
            yOrigin = primaryView.yMax + padding
            height = superviewHeight - primaryView.yMax - (superviewHeight - secondaryView.y) - (2 * padding)

        case .aboveMatchingLeft:
            xOrigin = primaryView.x + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)

        case .aboveMatchingRight:
            xOrigin = primaryView.xMax - width + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)

        case .aboveCentered:
            xOrigin = primaryView.xMid - (width / 2.0) + offset
            yOrigin = secondaryView.yMax + padding
            height = superviewHeight - secondaryView.yMax - (superviewHeight - primaryView.y) - (2 * padding)

        case .toTheLeftMatchingTop, .toTheLeftMatchingBottom, .toTheLeftCentered, .toTheRightMatchingTop, .toTheRightMatchingBottom, .toTheRightCentered:
            fatalError("[NEON] Invalid Align specified for alignBetweenVertical().")
        }

        if height < 0 {
            height = 0
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if width == AutoWidth {
            self.setDimensionAutomatically()
            self.alignBetweenVertical(align: align, primaryView: primaryView, secondaryView: secondaryView, padding: padding, width: self.height, offset: offset)
        }

    }
}
