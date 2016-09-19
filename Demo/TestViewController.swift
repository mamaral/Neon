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

        anchorLayer.backgroundColor = UIColor.red.cgColor
        view.layer.addSublayer(anchorLayer)

        anchorViewA.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewA.text = ""
        anchorViewA.textAlignment = .center
        anchorViewA.font = UIFont.boldSystemFont(ofSize: 20)
        anchorViewA.textColor = UIColor.white
        view.addSubview(anchorViewA)

        anchorViewB.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewB.text = ""
        anchorViewB.textAlignment = .center
        anchorViewB.font = UIFont.boldSystemFont(ofSize: 20)
        anchorViewB.textColor = UIColor.white
        view.addSubview(anchorViewB)

        anchorViewC.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewC.text = "C"
        anchorViewC.textAlignment = .center
        anchorViewC.font = UIFont.boldSystemFont(ofSize: 20)
        anchorViewC.textColor = UIColor.white
        view.addSubview(anchorViewC)

        anchorViewD.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        anchorViewD.text = "D"
        anchorViewD.textAlignment = .center
        anchorViewD.font = UIFont.boldSystemFont(ofSize: 20)
        anchorViewD.textColor = UIColor.white
        view.addSubview(anchorViewD)

        view1.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view1.text = "1"
        view1.textAlignment = .center
        view1.font = UIFont.boldSystemFont(ofSize: 20)
        view1.textColor = UIColor.white
        view.addSubview(view1)

        view2.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view2.text = "2"
        view2.textAlignment = .center
        view2.font = UIFont.boldSystemFont(ofSize: 20)
        view2.textColor = UIColor.white
        view.addSubview(view2)

        view3.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view3.text = "3"
        view3.textAlignment = .center
        view3.font = UIFont.boldSystemFont(ofSize: 20)
        view3.textColor = UIColor.white
        view.addSubview(view3)

        view4.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view4.text = "4"
        view4.textAlignment = .center
        view4.font = UIFont.boldSystemFont(ofSize: 20)
        view4.textColor = UIColor.white
        view.addSubview(view4)

        view5.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view5.text = "5"
        view5.textAlignment = .center
        view5.font = UIFont.boldSystemFont(ofSize: 20)
        view5.textColor = UIColor.white
        view.addSubview(view5)

        view6.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view6.text = "6"
        view6.textAlignment = .center
        view6.font = UIFont.boldSystemFont(ofSize: 20)
        view6.textColor = UIColor.white
        view.addSubview(view6)

        testLabel.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        testLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        testLabel.textAlignment = .center
        testLabel.font = UIFont.boldSystemFont(ofSize: 14)
        testLabel.textColor = UIColor.white
        testLabel.numberOfLines = 0
        view.addSubview(testLabel)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        anchorViewA.anchorInCorner(.topLeft, xPad: 20, yPad: 20, width: 200, height: 200)
        view1.align(.toTheRightMatchingTop, relativeTo: anchorViewA, padding: 20, width: 100, height: 100, offset: 20)
        view2.align(.underMatchingLeft, relativeTo: anchorViewA, padding: 20, width: 100, height: 100, offset: 20)
    }
}
