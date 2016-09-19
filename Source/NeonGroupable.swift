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
    public func groupInCenter(group: Group, views: [Frameable], padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCenter().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch group {
        case .horizontal:
            xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = (self.height / 2.0) - (height / 2.0)
            xAdjust = width + padding

        case .vertical:
            xOrigin = (self.width / 2.0) - (width / 2.0)
            yOrigin = (self.height - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
            yAdjust = height + padding
        }

        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

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
    public func groupInCorner(group: Group, views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        switch group {
        case .horizontal:
            groupInCornerHorizontal(views: views, inCorner: corner, padding: padding, width: width, height: height)

        case .vertical:
            groupInCornerVertical(views: views, inCorner: corner, padding: padding, width: width, height: height)
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
    public func groupAgainstEdge(group: Group, views: [Frameable], againstEdge edge: Edge, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAgainstEdge().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        var xAdjust : CGFloat = 0.0
        var yAdjust : CGFloat = 0.0

        switch edge {
        case .top:
            if group == .horizontal {
                xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                xAdjust = width + padding
            } else {
                xOrigin = (self.width / 2.0) - (width / 2.0)
                yAdjust = height + padding
            }

            yOrigin = padding

        case .left:
            if group == .horizontal {
                yOrigin = (self.height / 2.0) - (height / 2.0)
                xAdjust = width + padding
            } else {
                yOrigin = (self.height - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)) / 2.0
                yAdjust = height + padding
            }

            xOrigin = padding

        case .bottom:
            if group == .horizontal {
                xOrigin = (self.width - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)) / 2.0
                yOrigin = self.height - height - padding
                xAdjust = width + padding
            } else {
                xOrigin = (self.width / 2.0) - (width / 2.0)
                yOrigin = self.height - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
                yAdjust = height + padding
            }

        case .right:
            if group == .horizontal {
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
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

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
    public func groupAndAlign(group: Group, andAlign align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        switch group {
        case .horizontal:
            groupAndAlignHorizontal(align: align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)

        case .vertical:
            groupAndAlignVertical(align: align, views: views, relativeTo: sibling, padding: padding, width: width, height: height)
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
    public func groupAndFill(group: Group, views: [Frameable], padding: CGFloat) {
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
        case .horizontal:
            width = (self.width - (CGFloat(views.count + 1) * padding)) / CGFloat(views.count)
            height = self.height - (2 * padding)
            xAdjust = width + padding

        case .vertical:
            width = self.width - (2 * padding)
            height = (self.height - (CGFloat(views.count + 1) * padding)) / CGFloat(views.count)
            yAdjust = height + padding
        }

        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

            xOrigin += xAdjust
            yOrigin += yAdjust
        }
    }



    // MARK: Private utils
    //
    fileprivate func groupInCornerHorizontal(views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let xAdjust : CGFloat = width + padding

        switch corner {
        case .topLeft:
            xOrigin = padding
            yOrigin = padding

        case .topRight:
            xOrigin = self.width - ((CGFloat(views.count) * width) + (CGFloat(views.count) * padding))
            yOrigin = padding

        case .bottomLeft:
            xOrigin = padding
            yOrigin = self.height - height - padding

        case .bottomRight:
            xOrigin = self.width - ((CGFloat(views.count) * width) + (CGFloat(views.count) * padding))
            yOrigin = self.height - height - padding
        }

        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

            xOrigin += xAdjust
        }
    }

    fileprivate func groupInCornerVertical(views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let yAdjust : CGFloat = height + padding

        switch corner {
        case .topLeft:
            xOrigin = padding
            yOrigin = padding

        case .topRight:
            xOrigin = self.width - width - padding
            yOrigin = padding

        case .bottomLeft:
            xOrigin = padding
            yOrigin = self.height - ((CGFloat(views.count) * height) + (CGFloat(views.count) * padding))

        case .bottomRight:
            xOrigin = self.width - width - padding
            yOrigin = self.height - ((CGFloat(views.count) * height) + (CGFloat(views.count) * padding))
        }

        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

            yOrigin += yAdjust
        }
    }

    fileprivate func groupAndAlignHorizontal(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let xAdjust : CGFloat = width + padding

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - height

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - (height / 2.0)

        case .toTheLeftMatchingTop:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.y

        case .toTheLeftMatchingBottom:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.yMax - height

        case .toTheLeftCentered:
            xOrigin = sibling.x - (CGFloat(views.count) * width) - (CGFloat(views.count) * padding)
            yOrigin = sibling.yMid - (height / 2.0)

        case .underMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.yMax + padding

        case .underMatchingRight:
            xOrigin = sibling.xMax - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)
            yOrigin = sibling.yMax + padding

        case .underCentered:
            xOrigin = sibling.xMid - ((CGFloat(views.count) * width) + (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = sibling.yMax + padding

        case .aboveMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.y - height - padding

        case .aboveMatchingRight:
            xOrigin = sibling.xMax - (CGFloat(views.count) * width) - (CGFloat(views.count - 1) * padding)
            yOrigin = sibling.y - height - padding

        case .aboveCentered:
            xOrigin = sibling.xMid - ((CGFloat(views.count) * width) + (CGFloat(views.count - 1) * padding)) / 2.0
            yOrigin = sibling.y - height - padding
        }

        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)

            xOrigin += xAdjust
        }
    }

    fileprivate func groupAndAlignVertical(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }

        var xOrigin : CGFloat = 0.0
        var yOrigin : CGFloat = 0.0
        let yAdjust : CGFloat = height + padding

        switch align {
        case .toTheRightMatchingTop:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.y

        case .toTheRightMatchingBottom:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMax - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)

        case .toTheRightCentered:
            xOrigin = sibling.xMax + padding
            yOrigin = sibling.yMid - ((CGFloat(views.count) * height) + CGFloat(views.count - 1) * padding) / 2.0

        case .toTheLeftMatchingTop:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.y

        case .toTheLeftMatchingBottom:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMax - (CGFloat(views.count) * height) - (CGFloat(views.count - 1) * padding)

        case .toTheLeftCentered:
            xOrigin = sibling.x - width - padding
            yOrigin = sibling.yMid - ((CGFloat(views.count) * height) + CGFloat(views.count - 1) * padding) / 2.0

        case .underMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.yMax + padding

        case .underMatchingRight:
            xOrigin = sibling.xMax - width
            yOrigin = sibling.yMax + padding

        case .underCentered:
            xOrigin = sibling.xMid - (width / 2.0)
            yOrigin = sibling.yMax + padding

        case .aboveMatchingLeft:
            xOrigin = sibling.x
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
            
        case .aboveMatchingRight:
            xOrigin = sibling.xMax - width
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
            
        case .aboveCentered:
            xOrigin = sibling.xMid - (width / 2.0)
            yOrigin = sibling.y - (CGFloat(views.count) * height) - (CGFloat(views.count) * padding)
        }
        
        for view in views {
            view.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
            
            yOrigin += yAdjust
        }
    }
}
