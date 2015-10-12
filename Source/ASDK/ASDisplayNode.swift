//
//  ASDisplayNode.swift
//  Neon
//
//  Created by Topic, Zdenek on 12.10.15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import Foundation
import AsyncDisplayKit

// MARK: ASDisplayNode implementation of the Neon protocols.
//
extension ASDisplayNode : Frameable, Anchorable, Alignable, Groupable {
    public var superFrame: CGRect {
        guard let supernode = supernode else {
            return CGRectZero
        }
        
        return supernode.frame
    }
}