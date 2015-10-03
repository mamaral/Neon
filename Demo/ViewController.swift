//
//  ViewController.swift
//  Neon
//
//  Created by Mike on 9/16/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit
import Neon


class ViewController: UIViewController {
    let containerView : UIView = UIView()
    let anchorView : UIView = UIView()
    let view1 : UILabel = UILabel()
    let view2 : UILabel = UILabel()
    let view3 : UILabel = UILabel()
    let view4 : UILabel = UILabel()
    let view5 : UILabel = UILabel()
    let view6 : UILabel = UILabel()
    let view7 : UILabel = UILabel()
    let view8 : UILabel = UILabel()
    let view9 : UILabel = UILabel()
    let view10 : UILabel = UILabel()
    let view11 : UILabel = UILabel()
    let view12 : UILabel = UILabel()
    let view13 : UILabel = UILabel()
    let view14 : UILabel = UILabel()
    let view15 : UILabel = UILabel()
    let view16 : UILabel = UILabel()
    let view17 : UILabel = UILabel()
    let view18 : UILabel = UILabel()
    let view19 : UILabel = UILabel()
    let view20 : UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.clipsToBounds = true
        containerView.backgroundColor = UIColor(red: 61/255.0, green: 61/255.0, blue: 61/255.0, alpha: 1.0)
        view.addSubview(containerView)

        anchorView.backgroundColor = UIColor(red: 229/255.0, green: 72/255.0, blue: 26/255.0, alpha: 1.0)
        containerView.addSubview(anchorView)

        view1.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view1.text = "1"
        view1.textAlignment = .Center
        view1.font = UIFont.boldSystemFontOfSize(20)
        view1.textColor = UIColor.whiteColor()
        containerView.addSubview(view1)

        view2.backgroundColor = UIColor(red: 132/255.0, green: 169/255.0, blue: 57/255.0, alpha: 1.0)
        view2.text = "2"
        view2.textAlignment = .Center
        view2.font = UIFont.boldSystemFontOfSize(20)
        view2.textColor = UIColor.whiteColor()
        containerView.addSubview(view2)

        view3.backgroundColor = UIColor(red: 146/255.0, green: 83/255.0, blue: 72/255.0, alpha: 1.0)
        view3.text = "3"
        view3.textAlignment = .Center
        view3.font = UIFont.boldSystemFontOfSize(20)
        view3.textColor = UIColor.whiteColor()
        containerView.addSubview(view3)

        view4.backgroundColor = UIColor(red: 100/255.0, green: 112/255.0, blue: 108/255.0, alpha: 1.0)
        view4.text = "4"
        view4.textAlignment = .Center
        view4.font = UIFont.boldSystemFontOfSize(20)
        view4.textColor = UIColor.whiteColor()
        containerView.addSubview(view4)

        view5.backgroundColor = UIColor(red: 33/255.0, green: 154/255.0, blue: 209/255.0, alpha: 1.0)
        view5.text = "5"
        view5.textAlignment = .Center
        view5.font = UIFont.boldSystemFontOfSize(20)
        view5.textColor = UIColor.whiteColor()
        containerView.addSubview(view5)

        view6.backgroundColor = UIColor(red: 229/255.0, green: 174/255.0, blue: 84/255.0, alpha: 1.0)
        view6.text = "6"
        view6.textAlignment = .Center
        view6.font = UIFont.boldSystemFontOfSize(20)
        view6.textColor = UIColor.whiteColor()
        containerView.addSubview(view6)

        view7.backgroundColor = UIColor(red: 222/255.0, green: 81/255.0, blue: 62/255.0, alpha: 1.0)
        view7.text = "7"
        view7.textAlignment = .Center
        view7.font = UIFont.boldSystemFontOfSize(20)
        view7.textColor = UIColor.whiteColor()
        containerView.addSubview(view7)

        view8.backgroundColor = UIColor(red: 198/255.0, green: 173/255.0, blue: 138/255.0, alpha: 1.0)
        view8.text = "8"
        view8.textAlignment = .Center
        view8.font = UIFont.boldSystemFontOfSize(20)
        view8.textColor = UIColor.whiteColor()
        containerView.addSubview(view8)

        view9.backgroundColor = UIColor(red: 157/255.0, green: 104/255.0, blue: 80/255.0, alpha: 1.0)
        view9.text = "9"
        view9.textAlignment = .Center
        view9.font = UIFont.boldSystemFontOfSize(20)
        view9.textColor = UIColor.whiteColor()
        containerView.addSubview(view9)

        view10.backgroundColor = UIColor(red: 23/255.0, green: 59/255.0, blue: 140/255.0, alpha: 1.0)
        view10.text = "10"
        view10.textAlignment = .Center
        view10.font = UIFont.boldSystemFontOfSize(20)
        view10.textColor = UIColor.whiteColor()
        containerView.addSubview(view10)

        view11.backgroundColor = UIColor(red: 229/255.0, green: 174/255.0, blue: 84/255.0, alpha: 1.0)
        view11.text = "11"
        view11.textAlignment = .Center
        view11.font = UIFont.boldSystemFontOfSize(20)
        view11.textColor = UIColor.whiteColor()
        anchorView.addSubview(view11)

        view12.backgroundColor = UIColor(red: 33/255.0, green: 154/255.0, blue: 209/255.0, alpha: 1.0)
        view12.text = "12"
        view12.textAlignment = .Center
        view12.font = UIFont.boldSystemFontOfSize(20)
        view12.textColor = UIColor.whiteColor()
        anchorView.addSubview(view12)

        view13.backgroundColor = UIColor(red: 100/255.0, green: 112/255.0, blue: 108/255.0, alpha: 1.0)
        view13.text = "13"
        view13.textAlignment = .Center
        view13.font = UIFont.boldSystemFontOfSize(20)
        view13.textColor = UIColor.whiteColor()
        anchorView.addSubview(view13)

        view14.backgroundColor = UIColor(red: 198/255.0, green: 173/255.0, blue: 138/255.0, alpha: 1.0)
        view14.text = "14"
        view14.textAlignment = .Center
        view14.font = UIFont.boldSystemFontOfSize(20)
        view14.textColor = UIColor.whiteColor()
        containerView.addSubview(view14)

        view15.backgroundColor = UIColor(red: 146/255.0, green: 83/255.0, blue: 72/255.0, alpha: 1.0)
        view15.text = "15"
        view15.textAlignment = .Center
        view15.font = UIFont.boldSystemFontOfSize(20)
        view15.textColor = UIColor.whiteColor()
        containerView.addSubview(view15)

        view16.backgroundColor = UIColor(red: 78/255.0, green: 102/255.0, blue: 131/255.0, alpha: 1.0)
        view16.text = "16"
        view16.textAlignment = .Center
        view16.font = UIFont.boldSystemFontOfSize(20)
        view16.textColor = UIColor.whiteColor()
        containerView.addSubview(view16)

        view17.backgroundColor = UIColor(red: 33/255.0, green: 154/255.0, blue: 209/255.0, alpha: 1.0)
        view17.text = "17"
        view17.textAlignment = .Center
        view17.font = UIFont.boldSystemFontOfSize(20)
        view17.textColor = UIColor.whiteColor()
        containerView.addSubview(view17)

        view18.backgroundColor = UIColor(red: 146/255.0, green: 83/255.0, blue: 72/255.0, alpha: 1.0)
        view18.text = "18"
        view18.textAlignment = .Center
        view18.font = UIFont.boldSystemFontOfSize(20)
        view18.textColor = UIColor.whiteColor()
        containerView.addSubview(view18)

        view19.backgroundColor = UIColor(red: 23/255.0, green: 59/255.0, blue: 140/255.0, alpha: 1.0)
        view19.text = "19"
        view19.textAlignment = .Center
        view19.font = UIFont.boldSystemFontOfSize(20)
        view19.textColor = UIColor.whiteColor()
        containerView.addSubview(view19)

        view20.backgroundColor = UIColor(red: 222/255.0, green: 81/255.0, blue: 62/255.0, alpha: 1.0)
        view20.text = "20"
        view20.textAlignment = .Center
        view20.font = UIFont.boldSystemFontOfSize(20)
        view20.textColor = UIColor.whiteColor()
        containerView.addSubview(view20)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Static container for the demo.
        //
        containerView.fillSuperview(left: 10, right: 10, top: 25, bottom: 10)
        anchorView.anchorInCenter(width: 200, height: 200)

        layoutFrames()
    }

    func layoutFrames() {
        anchorView.groupInCorner(group: .Vertical, views: [view11, view12, view13], inCorner: .TopRight, padding: 10, width: 40, height: 40)
        view1.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: anchorView, padding: 10, height: 50)
        containerView.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingLeft, views: [view2, view3, view4], relativeTo: view1, padding: 10, width: 60, height: 60)
        view5.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: view4, padding: 10, height: 60)
        view6.alignAndFill(align: .UnderMatchingLeft, relativeTo: view2, padding: 10)
        view7.alignAndFillHeight(align: .AboveMatchingRight, relativeTo: view1, padding: 10, width: 60)
        view8.alignAndFillWidth(align: .ToTheLeftMatchingTop, relativeTo: view7, padding: 10, height: 70)
        view9.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: view8, secondaryView: anchorView, padding: 10, width: 100)
        view10.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: view9, secondaryView: view7, padding: 10, height: view9.height)
        view14.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10, width: 100, height: 100)
        view15.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: view9, secondaryView: view14, padding: 10, width: 50)
        view16.alignBetweenHorizontal(align: .ToTheRightMatchingBottom, primaryView: view14, secondaryView: view6, padding: 10, height: 40)
        view17.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: view15, secondaryView: anchorView, padding: 10, height: 100)
        view18.alignBetweenVertical(align: .UnderMatchingLeft, primaryView: anchorView, secondaryView: view16, padding: 10, width: anchorView.width)
        view19.alignBetweenHorizontal(align: .ToTheRightMatchingTop, primaryView: view14, secondaryView: view18, padding: 10, height: 50)
        view20.alignBetweenVertical(align: .UnderCentered, primaryView: view17, secondaryView: view19, padding: 10, width: view17.width)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = touches.first!
        let point = touch.locationInView(containerView)

        anchorView.frame = CGRectMake(point.x - (anchorView.width / 2.0), point.y - (anchorView.height / 2.0), anchorView.width, anchorView.height)

        layoutFrames()
    }
}

