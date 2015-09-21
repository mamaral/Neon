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
   let anchorView2 : UIView = UIView()
   let anchorView3 : UIView = UIView()
    let view1 : UILabel = UILabel()
    let view2 : UILabel = UILabel()
    let view3 : UILabel = UILabel()
    let view4 : UILabel = UILabel()
    let view5 : UILabel = UILabel()
    let view6 : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        anchorView.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        view.addSubview(anchorView)

        anchorView2.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        view.addSubview(anchorView2)

        anchorView3.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        view.addSubview(anchorView3)

        view1.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view1.text = "1"
        view1.textAlignment = .Center
        view1.font = UIFont.boldSystemFontOfSize(20)
        view1.textColor = UIColor.whiteColor()
        anchorView.addSubview(view1)

        view2.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view2.text = "2"
        view2.textAlignment = .Center
        view2.font = UIFont.boldSystemFontOfSize(20)
        view2.textColor = UIColor.whiteColor()
        anchorView.addSubview(view2)

        view3.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view3.text = "3"
        view3.textAlignment = .Center
        view3.font = UIFont.boldSystemFontOfSize(20)
        view3.textColor = UIColor.whiteColor()
        anchorView2.addSubview(view3)

        view4.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view4.text = "4"
        view4.textAlignment = .Center
        view4.font = UIFont.boldSystemFontOfSize(20)
        view4.textColor = UIColor.whiteColor()
        anchorView2.addSubview(view4)

        view5.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view5.text = "5"
        view5.textAlignment = .Center
        view5.font = UIFont.boldSystemFontOfSize(20)
        view5.textColor = UIColor.whiteColor()
        anchorView3.addSubview(view5)

        view6.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view6.text = "6"
        view6.textAlignment = .Center
        view6.font = UIFont.boldSystemFontOfSize(20)
        view6.textColor = UIColor.whiteColor()
        anchorView3.addSubview(view6)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        view.groupAgainstEdge(group: .Horizontal, views: [anchorView, anchorView2, anchorView3], againstEdge: .Top, padding: 100, width: 200, height: 200)
//        anchorView.anchorInCenter(width: 200, height: 200)
        let padding : CGFloat = 10.0
        let size : CGFloat = 50.0

        view1.anchorInCorner(.TopLeft, xPad: padding, yPad: padding, width: size, height: size)
        view2.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: view1, padding: padding, height: size / 2.0)

        view3.anchorInCorner(.BottomRight, xPad: padding, yPad: padding, width: size, height: size)
        view4.alignAndFillHeight(align: .AboveCentered, relativeTo: view3, padding: padding, width: size / 2.0)

        view5.anchorInCorner(.TopRight, xPad: padding, yPad: padding, width: size, height: size)
        view6.alignAndFill(align: .ToTheLeftMatchingTop, relativeTo: view5, padding: padding)
    }
}