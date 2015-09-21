# Neon

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


## The Fundamentals

In order to keep the syntax as clear and concise as possible, Neon uses enumerated values to encapsulate most of the fundamental layout concepts. Once you learn the four primary ways we describe relationships between views on screen, building layouts will be super quick and intuitive: `Corner`, `Edge`, `Align`, and `Group`.

### Corner

`Corner` is rather self-explanatory; it is used to specify in what corner a subview is anchored in inside its superview. In the below example view #1 is anchored in the `.TopLeft` corner, view #2 is in the `.TopRight` corner, and naturally view #3 and view #4 are anchored in the `.BottomLeft` and `.BottomRight` corners, respectively. Pretty simple, so far.

![Corner](Screenshots/corner.png)

### Edge

`Edge` is another pretty obvious one to follow. Views #1, #2, #3 and #4 are anchored to the `.Top`, `.Left`, `.Bottom`, and `.Right` edges, respectively.

![Edge](Screenshots/edge.png)

## Todo

- [ ] Finish initial implementation
- [ ] README documentation
- [ ] Code documentation
- [ ] Code coverage


## License

The source is made available under the MIT license. See LICENSE.txt for details.