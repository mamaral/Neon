# Neon
---

### Build your user interfaces like a boss, in Swift.

More will be coming very soon, stay tuned!


#### In the meantime, here's an intentionally convoluted example to show how easy it is to build very complex and dynamic layouts with Neon:

![Demo](Screenshots/demo.gif)

```swift
anchorView.groupInCorner(group: .Vertical, views: [view11, view12, view13], inCorner: .TopRight, padding: 10, width: 40, height: 40)
view1.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: anchorView, padding: 10, height: 50)
containerView.groupAndAlign(group: .Horizontal, andAlign: .UnderMatchingLeft, views: [view2, view3, view4], relativeTo: view1, padding: 10, width: 60, height: 60)
view5.alignAndFillWidth(align: .ToTheRightMatchingTop, relativeTo: view4, padding: 10, height: 60)
view6.alignAndFill(align: .UnderMatchingLeft, relativeTo: view2, padding: 10)
view7.alignAndFillHeight(align: .AboveMatchingRight, relativeTo: view1, padding: 10, width: 60)
view8.alignAndFillWidth(align: .ToTheLeftMatchingTop, relativeTo: view7, padding: 10, height: 70)
view9.alignBetweenVertical(align: .UnderMatchingLeft, topView: view8, bottomView: anchorView, padding: 10, width: 100)
view10.alignBetweenHorizontal(align: .ToTheRightMatchingTop, leftView: view9, rightView: view7, padding: 10, height: view9.height())
view14.anchorInCorner(.BottomLeft, xPad: 10, yPad: 10, width: 100, height: 100)
view15.alignBetweenVertical(align: .UnderMatchingLeft, topView: view9, bottomView: view14, padding: 10, width: 50)
view16.alignBetweenHorizontal(align: .ToTheRightMatchingBottom, leftView: view14, rightView: view6, padding: 10, height: 40)
view17.alignBetweenHorizontal(align: .ToTheRightMatchingTop, leftView: view15, rightView: anchorView, padding: 10, height: 100)
view18.alignBetweenVertical(align: .UnderMatchingLeft, topView: anchorView, bottomView: view16, padding: 10, width: anchorView.width())
view19.alignBetweenHorizontal(align: .ToTheRightMatchingTop, leftView: view14, rightView: view18, padding: 10, height: 50)
view20.alignBetweenVertical(align: .UnderCentered, topView: view17, bottomView: view19, padding: 10, width: view17.width())
```


## Todo

- [ ] README documentation
- [ ] Code documentation
- [ ] Code coverage


## License

The source is made available under the MIT license. See LICENSE.txt for details.