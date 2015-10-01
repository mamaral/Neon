//
//  NeonFrameable.swift
//  Neon
//
//  Created by Mike on 10/1/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit


protocol Frameable {
    var frame: CGRect { get }

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
}

extension Frameable {
    var x: CGFloat {
        return CGRectGetMinX(frame)
    }

    var xMid: CGFloat {
        return CGRectGetMinX(frame) + (CGRectGetWidth(frame) / 2.0)
    }

    var xMax: CGFloat {
        return CGRectGetMaxX(frame)
    }

    var y: CGFloat {
        return CGRectGetMinY(frame)
    }

    var yMid: CGFloat {
        return CGRectGetMinY(frame) + (CGRectGetHeight(frame) / 2.0)
    }

    var yMax: CGFloat {
        return CGRectGetMaxY(frame)
    }

    var width: CGFloat {
        return CGRectGetWidth(frame)
    }

    var height: CGFloat {
        return CGRectGetHeight(frame)
    }
}
