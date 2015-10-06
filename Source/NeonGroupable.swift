//
//  NeonGroupable.swift
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


public protocol Groupable : Frameable {}

public extension Groupable {

    /// Tell a view to group an array of its subviews centered, specifying the padding between each subview,
    /// as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically in the center.
    ///
    ///   - views: The array of views to grouped in the center. Depending on if the views are gouped horizontally
    /// or vertically, they will be positioned in order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - padding: The padding to be applied between the subviews.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    public func groupInCenter(group group: Group, views: [Frameable], padding: CGFloat, width: CGFloat, height: CGFloat) {
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
            xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = (self.height / 2.0) - (height / 2.0)
            xAdjust = width + padding

        case .Vertical:
            xOrigin = (self.width / 2.0) - (width / 2.0)
            yOrigin = (self.height - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
            yAdjust = height + padding
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }


    /// Tell a view to group an array of its subviews in one of its corners, specifying the padding between each subview,
    /// as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically in the corner.
    ///
    ///   - views: The array of views to grouped in the specified corner. Depending on if the views are gouped horizontally
    /// or vertically, they will be positioned in order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - inCorner: The specified corner the views will be grouped in.
    ///
    ///   - padding: The padding to be applied between the subviews and their superview.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    public func groupInCorner(group group: Group, views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        switch group {
        case .Horizontal:
            groupInCornerHorizontal(views, inCorner: corner, padding: padding, width: width, height: height)

        case .Vertical:
            groupInCornerVertical(views, inCorner: corner, padding: padding, width: width, height: height)
        }
    }


    /// Tell a view to group an array of its subviews against one of its edges, specifying the padding between each subview
    /// and their superview, as well as the size of each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically against the specified
    /// edge.
    ///
    ///   - views: The array of views to grouped against the spcified edge. Depending on if the views are gouped horizontally
    /// or vertically, they will be positioned in-order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - againstEdge: The specified edge the views will be grouped against.
    ///
    ///   - padding: The padding to be applied between each of the subviews and their superview.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    public func groupAgainstEdge(group group: Group, views: [Frameable], againstEdge edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
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
                xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                xAdjust = width + padding
            } else {
                xOrigin = (self.width / 2.0) - (width / 2.0)
                yAdjust = height + padding
            }

            yOrigin = padding

        case .Left:
            if group == .Horizontal {
                yOrigin = (self.height / 2.0) - (height / 2.0)
                xAdjust = width + padding
            } else {
                yOrigin = (self.height - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
                yAdjust = height + padding
            }

            xOrigin = padding

        case .Bottom:
            if group == .Horizontal {
                xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                yOrigin = self.height - height - padding
                xAdjust = width + padding
            } else {
                xOrigin = (self.width / 2.0) - (width / 2.0)
                yOrigin = self.height - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
                yAdjust = height + padding
            }

        case .Right:
            if group == .Horizontal {
                xOrigin = self.width - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
                yOrigin = (self.height / 2.0) - (height / 2.0)
                xAdjust = width + padding
            } else {
                xOrigin = self.width - width - padding
                yOrigin = (self.height - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
                yAdjust = height + padding
            }
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }


    /// Tell a view to group an array of its subviews relative to another of that view's subview, specifying the padding between
    /// each.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically against the specified
    /// sibling.
    ///
    ///   - andAlign: the `Align` type specifying how the views will be aligned relative to the sibling.
    ///
    ///   - views: The array of views to grouped against the sibling. Depending on if the views are gouped horizontally
    /// or vertically, they will be positioned in-order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - relativeTo: The sibling view that the views will be aligned relative to.
    ///
    ///   - padding: The padding to be applied between each of the subviews and the sibling.
    ///
    ///   - width: The width of each subview.
    ///
    ///   - height: The height of each subview.
    ///
    public func groupAndAlign(group group: Group, andAlign align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        switch group {
        case .Horizontal:
            groupAndAlignHorizontal(align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)

        case .Vertical:
            groupAndAlignVertical(align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)
        }
    }


    /// Tell a view to group an array of its subviews filling the width and height of the superview, specifying the padding between
    /// each subview and the superview.
    ///
    /// - parameters:
    ///   - group: The `Group` type specifying if the subviews will be laid out horizontally or vertically.
    ///
    ///   - views: The array of views to be grouped against the sibling. Depending on if the views are grouped horizontally
    /// or vertically, they will be positions in-order from left-to-right and top-to-bottom, respectively.
    ///
    ///   - padding: The padding to be applied between each of the subviews and the sibling.
    ///
    public func groupAndFill(group group: Group, views: [Frameable], padding: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndFill().")
            return
        }

        var xOrigin : CGFloat = padding
        var yOrigin : CGFloat = padding
        var width : CGFloat = 0.0
        var height : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch group {
        case .Horizontal:
            width = (self.width - (CGFloat(views.count + 1) * padding)) / CGFloat(views.count)
            height = self.height - (2 * padding)
            xAdjust = width + padding

        case .Vertical:
            width = self.width - (2 * padding)
            height = (self.height - (CGFloat(views.count + 1) * padding)) / CGFloat(views.count)
            yAdjust = height + padding
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }



    // MARK: Private utils
    //
    private func groupInCornerHorizontal(views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let xAdjust : CGFloat = width + padding

        switch corner {
        case .TopLeft:
            xOrigin = padding
            yOrigin = padding

        case .TopRight:
            xOrigin = self.width - ((CGFloat(views.count) * width) + (CGFloat(views.count) * padding))
            yOrigin = padding

        case .BottomLeft:
            xOrigin = padding
            yOrigin = self.height - height - padding

        case .BottomRight:
            xOrigin = self.width - ((CGFloat(views.count) * width) + (CGFloat(views.count) * padding))
            yOrigin = self.height - height - padding
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
        }
    }

    private func groupInCornerVertical(views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let yAdjust : CGFloat = height + padding

        switch corner {
        case .TopLeft:
            xOrigin = padding
            yOrigin = padding

        case .TopRight:
            xOrigin = self.width - width - padding
            yOrigin = padding

        case .BottomLeft:
            xOrigin = padding
            yOrigin = self.height - ((CGFloat(views.count) * height) + (CGFloat(views.count) * padding))

        case .BottomRight:
            xOrigin = self.width - width - padding
            yOrigin = self.height - ((CGFloat(views.count) * height) + (CGFloat(views.count) * padding))
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            yOrigin += yAdjust
        }
    }

    private func groupAndAlignHorizontal(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let xAdjust : CGFloat = width + padding

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height

        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0)

        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.y

        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.yMax - height

        case .ToTheLeftCentered:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.yMid - (height / 2.0)

        case .UnderMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.yMax + padding

        case .UnderMatchingRight:
            xOrigin = sibling.xMax - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)
            yOrigin = sibling.yMax + padding

        case .UnderCentered:
            xOrigin = sibling.xMid - ((CGFloat(views.count) * width) + (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = sibling.yMax + padding

        case .AboveMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.y - height - padding

        case .AboveMatchingRight:
            xOrigin = sibling.xMax - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)
            yOrigin = sibling.y - height - padding

        case .AboveCentered:
            xOrigin = sibling.xMid - ((CGFloat(views.count) * width) + (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = sibling.y - height - padding
        }

        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)

            xOrigin += xAdjust
        }
    }

    private func groupAndAlignVertical(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let yAdjust : CGFloat = height + padding

        switch align {
        case .ToTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y

        case .ToTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)

        case .ToTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - ((CGFloat(views.count) * height) + CGFloat(views.count - 1) * padding) / 2.0

        case .ToTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y

        case .ToTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMax - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)

        case .ToTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMid - ((CGFloat(views.count) * height) + CGFloat(views.count - 1) * padding) / 2.0

        case .UnderMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.yMax + padding

        case .UnderMatchingRight:
            xOrigin = sibling.xMax - width
            yOrigin = sibling.yMax + padding

        case .UnderCentered:
            xOrigin = sibling.xMid - (width / 2.0)
            yOrigin = sibling.yMax + padding

        case .AboveMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
            
        case .AboveMatchingRight:
            xOrigin = sibling.xMax - width
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
            
        case .AboveCentered:
            xOrigin = sibling.xMid - (width / 2.0)
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
        }
        
        for view in views {
            view.frame = CGRectMake(xOrigin, yOrigin, width, height)
            
            yOrigin += yAdjust
        }
    }
}
