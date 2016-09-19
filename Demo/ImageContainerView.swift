//
//  ImageContainerView.swift
//  Neon
//
//  Created by Mike on 9/26/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit
import Neon

class ImageContainerView: UIView {
    let imageView : UIImageView = UIImageView()
    let label : UILabel = UILabel()

    convenience init() {
        self.init(frame: CGRect.zero)

        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 4.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(white: 0.68, alpha: 1.0).cgColor
        self.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)

        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.anchorAndFillEdge(.top, xPad: 0, yPad: 0, otherSize: self.height * 0.7)
        label.alignAndFill(align: .underCentered, relativeTo: imageView, padding: 0)
    }
}
