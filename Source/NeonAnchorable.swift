//
//  NeonAnchorable.swift
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


public protocol Anchorable : Frameable {}

public extension Anchorable {

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
    public func fillSuperview(left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
        let width : CGFloat = superFrame.width - (left + right)
        let height : CGFloat = superFrame.height - (top + bottom)

        frame = CGRect(x: left, y: top, width: width, height: height)
    }


    /// Anchor a view in the center of its superview.
    ///
    /// - parameters:
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    public func anchorInCenter(width: CGFloat, height: CGFloat) {
        let xOrigin : CGFloat = (superFrame.width / 2.0) - (width / 2.0)
        let yOrigin : CGFloat = (superFrame.height / 2.0) - (height / 2.0)

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.anchorInCenter(width: width, height: self.height)
        }

        if width == AutoWidth {
            self.setDimensionAutomatically()
            self.anchorInCenter(width: self.width, height: height)
        }
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
    public func anchorInCorner(_ corner: Corner, xPad: CGFloat, yPad: CGFloat, width: CGFloat, height: CGFloat) {
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch corner {
        case .topLeft:
            xOrigin = xPad
            yOrigin = yPad

        case .bottomLeft:
            xOrigin = xPad
            yOrigin = superFrame.height - height - yPad

        case .topRight:
            xOrigin = superFrame.width - width - xPad
            yOrigin = yPad

        case .bottomRight:
            xOrigin = superFrame.width - width - xPad
            yOrigin = superFrame.height - height - yPad
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.anchorInCorner(corner, xPad: xPad, yPad: yPad, width: width, height: self.height)
        }

        if width == AutoWidth {
            self.setDimensionAutomatically()
            self.anchorInCorner(corner, xPad: xPad, yPad: yPad, width: self.width, height: height)
        }

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
    public func anchorToEdge(_ edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch edge {
        case .top:
            xOrigin = (superFrame.width / 2.0) - (width / 2.0)
            yOrigin = padding

        case .left:
            xOrigin = padding
            yOrigin = (superFrame.height / 2.0) - (height / 2.0)

        case .bottom:
            xOrigin = (superFrame.width / 2.0) - (width / 2.0)
            yOrigin = superFrame.height - height - padding

        case .right:
            xOrigin = superFrame.width - width - padding
            yOrigin = (superFrame.height / 2.0) - (height / 2.0)
        }

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight {
            self.setDimensionAutomatically()
            self.anchorToEdge(edge, padding: padding, width: width, height: self.height)
        }
        if width == AutoWidth {
            self.setDimensionAutomatically()
            self.anchorToEdge(edge, padding: padding, width: self.width, height: height)
        }
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
    public func anchorAndFillEdge(_ edge: Edge, xPad: CGFloat, yPad: CGFloat, otherSize: CGFloat) {
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0
        var autoSize : Bool = false

        switch edge {
        case .top:
            xOrigin = xPad
            yOrigin = yPad
            width = superFrame.width - (2 * xPad)
            height = otherSize
            autoSize = true

        case .left:
            xOrigin = xPad
            yOrigin = yPad
            width = otherSize
            height = superFrame.height - (2 * yPad)

        case .bottom:
            xOrigin = xPad
            yOrigin = superFrame.height - otherSize - yPad
            width = superFrame.width - (2 * xPad)
            height = otherSize
            autoSize = true

        case .right:
            xOrigin = superFrame.width - otherSize - xPad
            yOrigin = yPad
            width = otherSize
            height = superFrame.height - (2 * yPad)
        }
        
        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

        if height == AutoHeight && autoSize {
            self.setDimensionAutomatically()
            self.anchorAndFillEdge(edge, xPad: xPad, yPad: yPad, otherSize: self.height)
        }
    }
}
