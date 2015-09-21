//
//  TestViewController.swift
//  Neon
//
//  Created by Mike on 9/20/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    let anchorView : UIView = UIView()
    let view1 : UILabel = UILabel()
    let view2 : UILabel = UILabel()
    let view3 : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        anchorView.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        view.addSubview(anchorView)

        view1.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view1.text = "1"
        view1.textAlignment = .Center
        view1.font = UIFont.boldSystemFontOfSize(20)
        view1.textColor = UIColor.whiteColor()
        view.addSubview(view1)

        view2.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view2.text = "2"
        view2.textAlignment = .Center
        view2.font = UIFont.boldSystemFontOfSize(20)
        view2.textColor = UIColor.whiteColor()
        view.addSubview(view2)

        view3.backgroundColor = UIColor(red: 146/255.0, green: 83/255.0, blue: 72/255.0, alpha: 1.0)
        view3.text = "3"
        view3.textAlignment = .Center
        view3.font = UIFont.boldSystemFontOfSize(20)
        view3.textColor = UIColor.whiteColor()
        view.addSubview(view3)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        view.groupInCorner(group: .Vertical, views: [view1, view2, view3], inCorner: .BottomRight, padding: 10, width: 100, height: 100)
    }
}