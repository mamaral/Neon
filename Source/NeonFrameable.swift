//
//  NeonFrameable.swift
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


/// Types adopting the `Frameable` protocol calculate specific `frame` information, as well as provide the
/// frame information about their `superview` or `superlayer`.
///
public protocol Frameable : class {
  
    var frame: CGRect { get set }
    var superFrame: CGRect { get }

    /// Get the x origin of a view.
    ///
    /// - returns: The minimum x value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.x() // returns 10.0
    ///
    var x: CGFloat { get }


    /// Get the mid x of a view.
    ///
    /// - returns: The middle x value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.midX() // returns 7.5
    ///
    var xMid: CGFloat { get }


    /// Get the max x of a view.
    ///
    /// - returns: The maximum x value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.maxX() // returns 15.0
    ///
    var xMax: CGFloat { get }


    /// Get the y origin of a view.
    ///
    /// - returns: The minimum y value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.y() // returns 20.0
    ///
    var y: CGFloat { get }


    /// Get the mid y of a view.
    ///
    /// - returns: The middle y value of the view's frame
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.midY() // returns 13.5
    ///
    var yMid: CGFloat { get }


    /// Get the max y of a view.
    ///
    /// - returns: The maximum y value of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.maxY() // returns 27.0
    ///
    var yMax: CGFloat { get }


    /// Get the width of a view.
    ///
    /// - returns: The width of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.width() // returns 5.0
    ///
    var width: CGFloat { get }


    /// Get the height of a view.
    ///
    /// - returns: The height of the view's frame.
    ///
    /// Example
    /// -------
    ///     let frame = CGRectMake(10.0, 20.0, 5.0, 7.0)
    ///     frame.height() // returns 7.0
    ///
    var height: CGFloat { get }


    /// *To be used internally* TODO: Determine how to make this either private or internal.
    ///
    ///
    func setDimensionAutomatically()
}


extension Frameable {
  
    public var x: CGFloat {
        return frame.minX
    }

    public  var xMid: CGFloat {
        return frame.minX + (frame.width / 2.0)
    }

    public var xMax: CGFloat {
        return frame.maxX
    }

    public var y: CGFloat {
        return frame.minY
    }

    public var yMid: CGFloat {
        return frame.minY + (frame.height / 2.0)
    }

    public var yMax: CGFloat {
        return frame.maxY
    }

    public var width: CGFloat {
        return frame.width
    }

    public var height: CGFloat {
        return frame.height
    }
}
