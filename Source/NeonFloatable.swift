//
//  NeonFloatable.swift
//  Neon
//
//  Created by Mike on 5/10/16.
//  Copyright © 2016 Mike Amaral. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif


public protocol Floatable : Frameable {}

public extension Floatable {

    /// Float a view relative to a sibling view in the same superview.
    ///
    /// - parameters:
    ///   - float: The `FloatType` used to specify where and how this view is aligned with its sibling and relative
    /// to the superview.
    ///
    ///   - relativeTo: The sibling view this view will float relative to. **NOTE:** Ensure this sibling view shares
    /// the same superview as this view, and that the sibling view is not the same as this view, otherwise a
    /// `fatalError` is thrown.
    ///
    ///   - siblingPadding: The padding to be applied between this view and the sibling view, which is applied differently
    /// depending on the `FloatType` specified. For example, if floating `.ToTheRight` the padding is used
    /// to adjust the x origin of this view so it sits to the right of the sibling view.
    ///
    ///   - superViewPadding: The padding to be applied between this view and the superview, which is applied differently
    /// depending on the `FloatType` specified. For example, if floating `.ToTheRight` or `.ToTheLeft` the superViewPadding
    /// is used as the y origin of this view in the superview, and if floating `.Under` or `.Above` the superViewPadding is
    /// used as the x origin of this view in the superview.
    ///
    ///   - width: The width of the view.
    ///
    ///   - height: The height of the view.
    ///
    public func float(float: FloatType, relativeTo sibling: Frameable, siblingPadding: CGFloat, superViewPadding: CGFloat, width: CGFloat, height: CGFloat) {
        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0

        switch float {
        case .ToTheRight:
            xOrigin = sibling.xMax + siblingPadding
            yOrigin = superViewPadding

        case .ToTheLeft:
            xOrigin = sibling.x - width - siblingPadding
            yOrigin = superViewPadding

        case .Under:
            xOrigin = superViewPadding
            yOrigin = sibling.yMax + siblingPadding

        case .Above:
            xOrigin = superViewPadding
            yOrigin = sibling.y - height - siblingPadding
        }

        frame = CGRectMake(xOrigin, yOrigin, width, height)

        if height == AutoHeight {
            self.setHeightAutomatically()
            self.float(float, relativeTo: sibling, siblingPadding: siblingPadding, superViewPadding: superViewPadding, width: width, height: self.height)
        }
    }
}
