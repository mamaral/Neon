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
        
        var xAdjust: CGFloat = 0
        var yAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch group {
        case .Horizontal:
            xAdjust = self.width/2 - getViewCollectionWidth(adjustedViews, padding: padding)/2 + padding/2
        case .Vertical:
            yAdjust = self.height/2 - getViewCollectionHeight(adjustedViews, padding: padding)/2 + padding/2
        }
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch group {
            case .Horizontal:
                xOrigin = xAdjust
                yOrigin = self.height/2 - view.height/2
            case .Vertical:
                xOrigin = self.width/2 - view.width/2
                yOrigin = yAdjust
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            xAdjust = xAdjust + view.width + padding
            yAdjust = yAdjust + view.height + padding
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
        
        var xAdjust: CGFloat = 0
        var yAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch edge {
        case .Bottom:
            switch group {
            case .Horizontal:
                xAdjust = self.width/2 - getViewCollectionWidth(adjustedViews, padding: padding)/2 + padding/2
            case .Vertical:
                yAdjust = self.height - getViewCollectionHeight(adjustedViews, padding: padding)
            }
            
        case .Right:
            switch group {
            case .Horizontal:
                xAdjust = self.width - getViewCollectionWidth(adjustedViews, padding: padding)
            case .Vertical:
                yAdjust = self.height/2 - getViewCollectionHeight(adjustedViews, padding: padding)/2 + padding/2
            }
            
        case .Left:
            switch group {
            case .Horizontal:
                xAdjust = 0; yAdjust = 0
            case .Vertical:
                yAdjust = self.height/2 - getViewCollectionHeight(adjustedViews, padding: padding)/2 + padding/2
            }
            
        case .Top:
            switch group {
            case .Horizontal:
                xAdjust = self.width/2 - getViewCollectionWidth(adjustedViews, padding: padding)/2 + padding/2
            case .Vertical:
                xAdjust = 0; yAdjust = 0
            }
        }
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch edge {
            case .Top:
                switch group {
                case .Horizontal:
                    xOrigin = xAdjust
                    yOrigin = padding
                case .Vertical:
                    xOrigin = self.width/2 - view.width/2
                    yOrigin = padding + yAdjust
                }
                
            case .Left:
                switch group {
                case .Horizontal:
                    xOrigin = padding + xAdjust
                    yOrigin = self.height/2 - view.height/2
                case .Vertical:
                    xOrigin = padding
                    yOrigin = yAdjust
                }
                
            case .Bottom:
                switch group {
                case .Horizontal:
                    xOrigin = xAdjust
                    yOrigin = self.height - view.height - padding
                case .Vertical:
                    xOrigin = self.width/2 - view.width/2
                    yOrigin = yAdjust
                }
                
            case .Right:
                switch group {
                case .Horizontal:
                    xOrigin = xAdjust
                    yOrigin = self.height/2 - view.height/2
                case .Vertical:
                    xOrigin = self.width - view.width - padding
                    yOrigin = yAdjust
                }
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            xAdjust = xAdjust + view.width + padding
            yAdjust = yAdjust + view.height + padding
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
        
        var xAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch corner {
        case .TopLeft:
            fallthrough
            
        case .BottomLeft:
            xAdjust = padding
            
        case .TopRight:
            fallthrough
            
        case .BottomRight:
            xAdjust = self.width - getViewCollectionWidth(adjustedViews, padding: padding)
        }
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch corner {
            case .TopLeft:
                fallthrough
                
            case .TopRight:
                xOrigin = xAdjust
                yOrigin = padding
                
            case .BottomLeft:
                fallthrough
                
            case .BottomRight:
                xOrigin = xAdjust
                yOrigin = self.height - view.height - padding
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            xAdjust = view.frame.maxX + padding
        }
        
    }
    
    private func groupInCornerVertical(views: [Frameable], inCorner corner: Corner, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupInCorner().")
            return
        }
        
        var yAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch corner {
        case .TopLeft:
            fallthrough
            
        case .TopRight:
            yAdjust = padding
            
        case .BottomLeft:
            fallthrough
            
        case .BottomRight:
            yAdjust = self.height - getViewCollectionHeight(adjustedViews, padding: padding)
        }
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch corner {
            case .TopLeft:
                fallthrough
                
            case .BottomLeft:
                xOrigin = padding
                yOrigin = yAdjust
                
            case .TopRight:
                fallthrough
                
            case .BottomRight:
                xOrigin = self.width - view.width - padding
                yOrigin = yAdjust
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            yAdjust = view.frame.maxY + padding
        }
    }
    
    private func groupAndAlignHorizontal(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }
        
        var xAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch align {
        case .UnderMatchingLeft:
            fallthrough
            
        case .AboveMatchingLeft:
            fallthrough
            
        case .ToTheRightCentered:
            fallthrough
            
        case .ToTheRightMatchingTop:
            fallthrough
            
        case .ToTheRightMatchingBottom:
            xAdjust = 0
            
        case .ToTheLeftMatchingTop:
            fallthrough
            
        case .ToTheLeftMatchingBottom:
            fallthrough
            
        case .ToTheLeftCentered:
            xAdjust = sibling.x - getViewCollectionWidth(views, padding: padding)
            
        case .UnderMatchingRight:
            fallthrough
            
        case .AboveMatchingRight:
            xAdjust = sibling.xMax - getViewCollectionWidth(views, padding: padding)
            
        case .UnderCentered:
            fallthrough
            
        case .AboveCentered:
            xAdjust = sibling.xMax - sibling.width/2 - getViewCollectionWidth(views, padding: padding)/2 + padding/2
        }
        
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch align {
            case .ToTheLeftMatchingTop:
                xOrigin = xAdjust
                yOrigin = sibling.y
                
            case .UnderMatchingRight:
                xOrigin = xAdjust + padding
                yOrigin = sibling.yMax + padding
                
            case .UnderCentered:
                xOrigin = xAdjust
                yOrigin = sibling.yMax + padding
                
            case .UnderMatchingLeft:
                if xAdjust == 0 {
                    xOrigin = sibling.x
                    yOrigin = sibling.yMax + padding
                } else {
                    xOrigin = sibling.x + xAdjust
                    yOrigin = sibling.yMax + padding
                }
                
            case .ToTheLeftMatchingBottom:
                xOrigin = xAdjust
                yOrigin = sibling.yMax - view.height
                
            case .ToTheLeftCentered:
                xOrigin = xAdjust
                yOrigin = sibling.yMid - view.height/2
                
            case .ToTheRightMatchingTop:
                xOrigin = sibling.xMax + xAdjust + padding
                yOrigin = sibling.y
                
            case .ToTheRightMatchingBottom:
                xOrigin = sibling.xMax + xAdjust + padding
                yOrigin = sibling.yMax - view.height
                
            case .ToTheRightCentered:
                xOrigin = sibling.xMax + xAdjust + padding
                yOrigin = sibling.yMid - view.height/2
                
            case .AboveMatchingRight:
                xOrigin = xAdjust + padding
                yOrigin = sibling.y - view.height - padding
                
            case .AboveCentered:
                xOrigin = xAdjust
                yOrigin = sibling.y - view.height - padding
                
            case .AboveMatchingLeft:
                if xAdjust == 0 {
                    xOrigin = sibling.x
                    yOrigin = sibling.y - view.height - padding
                } else {
                    xOrigin = sibling.x + xAdjust
                    yOrigin = sibling.y - view.height - padding
                }
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            xAdjust = xAdjust + view.width + padding
        }
    }
    
    private func groupAndAlignVertical(align: Align, views: [Frameable], relativeTo sibling: Frameable, padding: CGFloat, width: CGFloat, height: CGFloat) {
        if views.count == 0 {
            print("[NEON] Warning: No subviews provided to groupAndAlign().")
            return
        }
        
        var yAdjust: CGFloat = 0
        let adjustedViews: [Frameable] = setAutoWidthAutoHeight(views, width: width, height: height)
        
        switch align {
        case .UnderCentered:
            fallthrough
            
        case .UnderMatchingLeft:
            fallthrough
            
        case .UnderMatchingRight:
            fallthrough
            
        case .ToTheLeftMatchingTop:
            fallthrough
            
        case .ToTheRightMatchingTop:
            yAdjust = 0
            
        case .AboveMatchingLeft:
            fallthrough
            
        case .AboveMatchingRight:
            fallthrough
            
        case .AboveCentered:
            yAdjust = sibling.y - getViewCollectionHeight(views, padding: padding)
            
        case .ToTheLeftMatchingBottom:
            yAdjust = sibling.yMax - getViewCollectionHeight(views, padding: padding)
            
        case .ToTheRightMatchingBottom:
            yAdjust = sibling.yMax - getViewCollectionHeight(views, padding: padding) + padding
            
        case .ToTheRightCentered:
            fallthrough
            
        case .ToTheLeftCentered:
            yAdjust = sibling.height/2 + sibling.y - getViewCollectionHeight(views, padding: padding)/2 + padding/2
        }
        
        
        for view in adjustedViews {
            let xOrigin: CGFloat
            let yOrigin: CGFloat
            
            switch align {
            case .AboveMatchingLeft:
                xOrigin = sibling.x
                yOrigin = yAdjust
                
            case .ToTheRightMatchingTop:
                xOrigin = sibling.xMax + padding
                yOrigin = sibling.y + yAdjust
                
            case .ToTheRightMatchingBottom:
                fallthrough
                
            case .ToTheRightCentered:
                xOrigin = sibling.xMax + padding
                yOrigin = yAdjust
                
            case .AboveMatchingRight:
                xOrigin = sibling.xMax - view.width
                yOrigin = yAdjust
                
            case .UnderMatchingLeft:
                xOrigin = sibling.x
                yOrigin = sibling.yMax + yAdjust + padding
                
            case .UnderMatchingRight:
                xOrigin = sibling.xMax - view.width
                yOrigin = sibling.yMax + yAdjust + padding
                
            case .ToTheLeftMatchingTop:
                xOrigin = sibling.x - view.width - padding
                yOrigin = sibling.y + yAdjust
                
            case .ToTheLeftMatchingBottom:
                xOrigin = sibling.x - view.width - padding
                yOrigin = yAdjust + padding
                
            case .ToTheLeftCentered:
                xOrigin = sibling.x - view.width - padding
                yOrigin = yAdjust
                
            case .UnderCentered:
                xOrigin = sibling.xMax - sibling.width/2 - view.width/2
                yOrigin = sibling.yMax + yAdjust + padding
                
            case .AboveCentered:
                xOrigin = sibling.xMax - sibling.width/2 - view.width/2
                yOrigin = yAdjust
            }
            
            view.frame = setViewFrame(view, width: width, height: height, xOrigin: xOrigin, yOrigin: yOrigin)
            yAdjust = yAdjust + view.height + padding
        }
    }
    
    private func setAutoWidthAutoHeight(views: [Frameable], width: CGFloat, height: CGFloat) -> [Frameable] {
        let tempHeight: CGFloat = height
        let tempWidth: CGFloat = width
        
        for view in views {
            if height == AutoHeight && width == AutoWidth {
                view.setDimensionAutomatically()
            } else if height == AutoHeight || width == AutoWidth {
                view.setDimensionAutomatically()
                if width == AutoWidth {
                    view.frame.size.height = tempHeight
                }
                if height == AutoHeight {
                    view.frame.size.width = tempWidth
                }
            } else {
                view.frame.size.width = width
                view.frame.size.height = height
            }
        }
        
        return views
    }
    
    // MARK: Helper functions
    //
    private func setViewFrame(view: Frameable, width: CGFloat, height: CGFloat, xOrigin: CGFloat, yOrigin: CGFloat) -> CGRect {
        if height == AutoHeight || width == AutoWidth {
            return CGRectMake(xOrigin, yOrigin, view.width, view.height)
        } else {
            return CGRectMake(xOrigin, yOrigin, width, height)
        }
    }
    
    private func getViewCollectionWidth(views: [Frameable], padding: CGFloat) -> CGFloat {
        var viewCollectionWidth: CGFloat = 0
        for view in views {
            viewCollectionWidth += view.width + padding
        }
        return viewCollectionWidth
    }
    
    private func getViewCollectionHeight(views: [Frameable], padding: CGFloat) -> CGFloat {
        var viewCollectionHeight: CGFloat = 0
        for view in views {
            viewCollectionHeight += view.height + padding
        }
        return viewCollectionHeight
    }
}
