//
//  TestViewController.swift
//  Neon
//
//  Created by Mike on 9/20/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit
import Neon

class TestViewController: UIViewController {
    let anchorLayer : CALayer = CALayer()
    let anchorViewA : UILabel = UILabel()
    let anchorViewB : UILabel = UILabel()
    let anchorViewC : UILabel = UILabel()
    let anchorViewD : UILabel = UILabel()
    let view1 : UILabel = UILabel()
    let view2 : UILabel = UILabel()
    let view3 : UILabel = UILabel()
    let view4 : UILabel = UILabel()
    let view5 : UILabel = UILabel()
    let view6 : UILabel = UILabel()
    let testLabel : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        anchorLayer.backgroundColor = UIColor.redColor().CGColor
        view.layer.addSublayer(anchorLayer)

        anchorViewA.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewA.text = ""
        anchorViewA.textAlignment = .Center
        anchorViewA.font = UIFont.boldSystemFontOfSize(20)
        anchorViewA.textColor = UIColor.whiteColor()
        view.addSubview(anchorViewA)

        anchorViewB.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewB.text = ""
        anchorViewB.textAlignment = .Center
        anchorViewB.font = UIFont.boldSystemFontOfSize(20)
        anchorViewB.textColor = UIColor.whiteColor()
        view.addSubview(anchorViewB)

        anchorViewC.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewC.text = "C"
        anchorViewC.textAlignment = .Center
        anchorViewC.font = UIFont.boldSystemFontOfSize(20)
        anchorViewC.textColor = UIColor.whiteColor()
        view.addSubview(anchorViewC)

        anchorViewD.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewD.text = "D"
        anchorViewD.textAlignment = .Center
        anchorViewD.font = UIFont.boldSystemFontOfSize(20)
        anchorViewD.textColor = UIColor.whiteColor()
        view.addSubview(anchorViewD)

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

        view3.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view3.text = "3"
        view3.textAlignment = .Center
        view3.font = UIFont.boldSystemFontOfSize(20)
        view3.textColor = UIColor.whiteColor()
        view.addSubview(view3)

        view4.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view4.text = "4"
        view4.textAlignment = .Center
        view4.font = UIFont.boldSystemFontOfSize(20)
        view4.textColor = UIColor.whiteColor()
        view.addSubview(view4)

        view5.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view5.text = "5"
        view5.textAlignment = .Center
        view5.font = UIFont.boldSystemFontOfSize(20)
        view5.textColor = UIColor.whiteColor()
        view.addSubview(view5)

        view6.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view6.text = "6"
        view6.textAlignment = .Center
        view6.font = UIFont.boldSystemFontOfSize(20)
        view6.textColor = UIColor.whiteColor()
        view.addSubview(view6)

        testLabel.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        testLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        testLabel.textAlignment = .Center
        testLabel.font = UIFont.boldSystemFontOfSize(14)
        testLabel.textColor = UIColor.whiteColor()
        testLabel.numberOfLines = 0
        view.addSubview(testLabel)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

//        anchorViewA.anchorInCorner(.TopLeft, xPad: 20, yPad: 20, width: 100, height: 100)
//        anchorViewB.anchorInCorner(.TopRight, xPad: 20, yPad: 20, width: 100, height: 100)
//        testLabel.alignAndFillWidth(align: .ToTheRightCentered, relativeTo: anchorViewA, padding: 5, height: AutoHeight)
        testLabel.anchorToEdge(.Left, padding: 10, width: 400, height: AutoHeight)
    }
}
