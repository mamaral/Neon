//
//  Neon.swift
//  Neon
//
//  Created by Mike on 9/16/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import Cocoa
#endif


// MARK: Right to left support
//
///
fileprivate var isRightToLeft: Bool {
    #if os(iOS)
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    #else
        return NSApplication.shared().userInterfaceLayoutDirection == .rightToLeft
    #endif
}


// MARK: AutoHeight
//
///
/// `CGFloat` constant used to specify that you want the height to be automatically calculated
/// using `sizeToFit()`.
///
public let AutoHeight : CGFloat = -1
public let AutoWidth : CGFloat = -1


// MARK: Corner
//
///
/// Specifies a corner of a frame.
///
/// **topLeft**: The upper-left corner of the frame.
///
/// **topRight**: The upper-right corner of the frame.
///
/// **bottomLeft**: The bottom-left corner of the frame.
///
/// **bottomRight**: The upper-right corner of the frame.
///
public enum Corner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    public static var topLeading: Corner {
        return isRightToLeft ? .topRight : .topLeft
    }
    
    public static var topTrailing: Corner {
        return isRightToLeft ? .topLeft : .topRight
    }
    
    public static var bottomLeading: Corner {
        return isRightToLeft ? .bottomRight : .bottomLeft
    }
    
    public static var bottomTrailing: Corner {
        return isRightToLeft ? .bottomLeft : .bottomRight
    }
}


// MARK: Edge
//
///
/// Specifies an edge, or face, of a frame.
///
/// **top**: The top edge of the frame.
///
/// **left**: The left edge of the frame.
///
/// **bottom**: The bottom edge of the frame.
///
/// **right**: The right edge of the frame.
///
public enum Edge {
    case top
    case left
    case bottom
    case right
    
    public static var leading: Edge {
        return isRightToLeft ? .right : .left
    }
    
    public static var trailing: Edge {
        return isRightToLeft ? .left : .right
    }
}


// MARK: Align Type
//
///
/// Specifies how a view will be aligned relative to the sibling view.
///
/// **toTheRightMatchingTop**: Specifies that the view should be aligned to the right of a sibling, matching the
/// top, or y origin, of the sibling's frame.
///
/// **toTheRightMatchingBottom**: Specifies that the view should be aligned to the right of a sibling, matching
/// the bottom, or max y value, of the sibling's frame.
///
/// **toTheRightCentered**: Specifies that the view should be aligned to the right of a sibling, and will be centered
/// to either match the vertical center of the sibling's frame or centered vertically within the superview, depending
/// on the context.
///
/// **toTheLeftMatchingTop**: Specifies that the view should be aligned to the left of a sibling, matching the top,
/// or y origin, of the sibling's frame.
///
/// **toTheLeftMatchingBottom**: Specifies that the view should be aligned to the left of a sibling, matching the
/// bottom, or max y value, of the sibling's frame.
///
/// **toTheLeftCentered**: Specifies that the view should be aligned to the left of a sibling, and will be centered
/// to either match the vertical center of the sibling's frame or centered vertically within the superview, depending
/// on the context.
///
/// **underMatchingLeft**: Specifies that the view should be aligned under a sibling, matching the left, or x origin,
/// of the sibling's frame.
///
/// **underMatchingRight**: Specifies that the view should be aligned under a sibling, matching the right, or max y
/// of the sibling's frame.
///
/// **underCentered**: Specifies that the view should be aligned under a sibling, and will be centered to either match
/// the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
///
/// **aboveMatchingLeft**: Specifies that the view should be aligned above a sibling, matching the left, or x origin
/// of the sibling's frame.
///
/// **aboveMatchingRight**: Specifies that the view should be aligned above a sibling, matching the right, or max x
/// of the sibling's frame.
///
/// **aboveCentered**: Specifies that the view should be aligned above a sibling, and will be centered to either match
/// the horizontal center of the sibling's frame or centered horizontally within the superview, depending on the context.
///
public enum Align {
    case toTheRightMatchingTop
    case toTheRightMatchingBottom
    case toTheRightCentered
    case toTheLeftMatchingTop
    case toTheLeftMatchingBottom
    case toTheLeftCentered
    case underMatchingLeft
    case underMatchingRight
    case underCentered
    case aboveMatchingLeft
    case aboveMatchingRight
    case aboveCentered
    
    public static var toTheLeadingMatchingTop: Align {
        return isRightToLeft ? .toTheRightMatchingTop : .toTheLeftMatchingTop
    }
    
    public static var toTheTrailingMatchingTop: Align {
        return isRightToLeft ? .toTheLeftMatchingTop : .toTheRightMatchingTop
    }
    
    public static var toTheLeadingMatchingBottom: Align {
        return isRightToLeft ? .toTheRightMatchingBottom : .toTheLeftMatchingBottom
    }
    
    public static var toTheTrailingMatchingBottom: Align {
        return isRightToLeft ? .toTheLeftMatchingBottom : .toTheRightMatchingBottom
    }
    
    public static var toTheLeadingCentered: Align {
        return isRightToLeft ? .toTheRightCentered : .toTheLeftCentered
    }
    
    public static var toTheTrailingCentered: Align {
        return isRightToLeft ? .toTheLeftCentered : .toTheRightCentered
    }
    
    public static var underMatchingLeading: Align {
        return isRightToLeft ? .underMatchingRight : .underMatchingLeft
    }
    
    public static var underMatchingTrailing: Align {
        return isRightToLeft ? .underMatchingLeft : .underMatchingRight
    }
    
    public static var aboveMatchingLeading: Align {
        return isRightToLeft ? .aboveMatchingRight : .aboveMatchingLeft
    }
    
    public static var aboveMatchingTrailing: Align {
        return isRightToLeft ? .aboveMatchingLeft : .aboveMatchingRight
    }
}


// MARK: Group Type
//
///
/// Specifies how a group will be laid out.
///
/// **horizontal**: Specifies that the views should be aligned relative to eachother horizontally.
///
/// **vertical**: Specifies that the views should be aligned relative to eachother vertically.
///
public enum Group {
    case horizontal
    case vertical
}
