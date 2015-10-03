//
//  FacebookProfileExampleViewController.swift
//  Neon
//
//  Created by Mike on 9/26/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit
import Neon


class TwitterProfileExampleViewController: UIViewController {
    let searchBar : UIImageView = UIImageView()
    let bannerImageView : UIImageView = UIImageView()
    let bannerMaskView : UIView = UIView()
    let avatarImageView : UIImageView = UIImageView()
    let nameLabel : UILabel = UILabel()
    let cameraButton : UIButton = UIButton(type: .Custom)

    let buttonContainerView : UIView = UIView()
    let postButton : IconButton = IconButton()
    let updateInfoButton : IconButton = IconButton()
    let activityLogButton : IconButton = IconButton()
    let moreButton : IconButton = IconButton()

    let buttonContainerView2 : UIView = UIView()
    let aboutView : ImageContainerView = ImageContainerView()
    let photosView : ImageContainerView = ImageContainerView()
    let friendsView : ImageContainerView = ImageContainerView()

    convenience init() {
        self.init(nibName:nil, bundle:nil)

        // So I cheated here... shhhh!
        // (can't take all damn day making this match perfectly!)
        searchBar.image = UIImage(named: "searchBar")
        searchBar.contentMode = .ScaleAspectFit

        bannerImageView.image = UIImage(named: "banner")
        bannerImageView.contentMode = .ScaleAspectFill
        bannerImageView.clipsToBounds = true

        bannerMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.layer.cornerRadius = 1.0
        avatarImageView.layer.borderColor = UIColor.whiteColor().CGColor
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.clipsToBounds = true

        cameraButton.setImage(UIImage(named: "camera"), forState: .Normal)

        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = "Mike\nAmaral"
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 33)

        buttonContainerView.backgroundColor = UIColor.whiteColor()
        buttonContainerView.layer.shadowColor = UIColor.blackColor().CGColor
        buttonContainerView.layer.shadowOffset = CGSizeMake(0, 0.5)
        buttonContainerView.layer.shadowOpacity = 0.4

        postButton.label.text = "Post"
        postButton.imageView.image = UIImage(named: "post")

        updateInfoButton.label.text = "Update Info"
        updateInfoButton.imageView.image = UIImage(named: "updateInfo")

        activityLogButton.label.text = "Activity Log"
        activityLogButton.imageView.image = UIImage(named: "activityLog")

        moreButton.label.text = "More"
        moreButton.imageView.image = UIImage(named: "more")

        buttonContainerView2.backgroundColor = UIColor.clearColor()

        aboutView.imageView.image = UIImage(named: "about")
        aboutView.label.text = "About"

        photosView.imageView.image = UIImage(named: "photos")
        photosView.label.text = "Photos"

        friendsView.imageView.image = UIImage(named: "friends")
        friendsView.label.text = "Friends"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = searchBar

        view.backgroundColor = UIColor(red: 211/255.0, green: 214/255.0, blue: 219/255.0, alpha: 1.0)

        view.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerMaskView)
        bannerImageView.addSubview(cameraButton)
        bannerImageView.addSubview(avatarImageView)
        bannerImageView.addSubview(nameLabel)

        view.addSubview(buttonContainerView)
        buttonContainerView.addSubview(postButton)
        buttonContainerView.addSubview(updateInfoButton)
        buttonContainerView.addSubview(activityLogButton)
        buttonContainerView.addSubview(moreButton)

        view.addSubview(buttonContainerView2)
        buttonContainerView2.addSubview(aboutView)
        buttonContainerView2.addSubview(photosView)
        buttonContainerView2.addSubview(friendsView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layoutFrames()
    }

    func layoutFrames() {
        let isLandscape : Bool = UIDevice.currentDevice().orientation.isLandscape.boolValue
        let bannerHeight : CGFloat = view.height * 0.465
        let avatarHeightMultipler : CGFloat = isLandscape ? 0.75 : 0.43
        let avatarSize = bannerHeight * avatarHeightMultipler

        searchBar.fillSuperview()
        bannerImageView.anchorAndFillEdge(.Top, xPad: 0, yPad: 0, otherSize: bannerHeight)
        bannerMaskView.fillSuperview()
        avatarImageView.anchorInCorner(.BottomLeft, xPad: 15, yPad: 15, width: avatarSize, height: avatarSize)
        nameLabel.alignAndFillWidth(align: .ToTheRightCentered, relativeTo: avatarImageView, padding: 15, height: 120)
        cameraButton.anchorInCorner(.BottomRight, xPad: 10, yPad: 7, width: 28, height: 28)
        buttonContainerView.alignAndFillWidth(align: .UnderCentered, relativeTo: bannerImageView, padding: 0, height: 62)
        buttonContainerView.groupAndFill(group: .Horizontal, views: [postButton, updateInfoButton, activityLogButton, moreButton], padding: 10)
        buttonContainerView2.alignAndFillWidth(align: .UnderCentered, relativeTo: buttonContainerView, padding: 0, height: 120)
        buttonContainerView2.groupAndFill(group: .Horizontal, views: [aboutView, photosView, friendsView], padding: 8)
    }
}

