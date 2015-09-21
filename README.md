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

Neon is built around how user interfaces are naturally designed - primary views are anchored to the sides / corners of the screen, and secondary views are laid out relative to them.

---

## Anchoring Views

### Center

There are a few ways you can anchor views using Neon, and the first and most simple is anchoring a view in the center of its superview:

```swift
view1.anchorInCenter(width: size, height: size)
```

![Center](Screenshots/center.png)
---

### Filling Superview

Sometimes you want a view to fill its superview entirely, which couldn't be easier.

```swift
view.fillSuperview()
```

Optionally, if you want a view to fill its superview with padding, you can provide padding instead:

```swift
view1.fillSuperview(left: padding, right: padding, top: padding, bottom: padding)
```

![Fill](Screenshots/fill.png)
---

### Corner

The second anchoring method is anchoring a view in its superview's `Corner`. As you might have guessed, the four corners are `.TopLeft`, `.TopRight`, `.BottomLeft`, `.BottomRight`, and coupled with the `anchorInCorner()` function, you can easily anchor a view in any corner like this:

```swift
view1.anchorInCorner(.TopLeft, xPad: padding, yPad: padding, width: size, height: size)
view2.anchorInCorner(.TopRight, xPad: padding, yPad: padding, width: size, height: size)
view3.anchorInCorner(.BottomLeft, xPad: padding, yPad: padding, width: size, height: size)
view4.anchorInCorner(.BottomRight, xPad: padding, yPad: padding, width: size, height: size)
```

![Corner](Screenshots/corner.png)
---

### Edge

`Edge` is another pretty obvious one to follow - it specifies on what edge of its superview a view will be anchored to. The four types are `.Top`, `.Left`, `.Bottom`, or `.Right`, and similar to previous examples, you can use the `anchorToEdge()` function to anchor a view to an edge:

```swift
view1.anchorToEdge(.Top, padding: padding, width: size, height: size)
view2.anchorToEdge(.Left, padding: padding, width: size, height: size)
view3.anchorToEdge(.Bottom, padding: padding, width: size, height: size)
view4.anchorToEdge(.Right, padding: padding, width: size, height: size)
```

![Edge](Screenshots/edge.png)
---


### Filling an edge

Sometimes, you want to anchor a view against an edge, filling that edge; imagine something like a banner photo for a profile page. Again, this is made as simple as possible using the `anchorAndFillEdge()` function:

```swift
view1.anchorAndFillEdge(.Top, xPad: padding, yPad: padding, otherSize: size)
view2.anchorAndFillEdge(.Bottom, xPad: padding, yPad: padding, otherSize: size)
view3.anchorAndFillEdge(.Left, xPad: padding, yPad: padding, otherSize: size)
view4.anchorAndFillEdge(.Right, xPad: padding, yPad: padding, otherSize: size)
```

![Fill Edge](Screenshots/fill_edge.png)


> Note that `anchorAndFillEdge()` accepts a parameter called `otherSize`. That parameter is used to set the *other size* that isn't automatically calculated by filling the edge, meaning that if you specify that you want to anchor to and fill the top edge, the width will be automatically calculated, but the height is still unknown, so the value passed in to `otherSize` will be used to set the height. Subsequently, if you want to anchor to and fill the left edge, the height is automatically calculated and `otherSize` will be used to set the width of the view.
> 
---

## Align

Now that we've anchored primary views, we can start making our UI more complex by aligning other views *relative to other sibling views*, using the (you guessed it) `Align` value. **Sibling views** are views that share the same superview directly. There are twelve `Align` types, and they are all pretty self-explanatory - here's an example using all nine with the `align()` function:

```
view1.align(.AboveMatchingLeft, relativeTo: anchorView, padding: padding, width: size, height: size)
view2.align(.AboveCentered, relativeTo: anchorView, padding: padding, width: size, height: size)
view3.align(.AboveMatchingRight, relativeTo: anchorView, padding: padding, width: size, height: size)
view4.align(.ToTheRightMatchingTop, relativeTo: anchorView, padding: padding, width: size, height: size)
view5.align(.ToTheRightCentered, relativeTo: anchorView, padding: padding, width: size, height: size)
view6.align(.ToTheRightMatchingBottom, relativeTo: anchorView, padding: padding, width: size, height: size)
view7.align(.UnderMatchingRight, relativeTo: anchorView, padding: padding, width: size, height: size)
view8.align(.UnderCentered, relativeTo: anchorView, padding: padding, width: size, height: size)
view9.align(.UnderMatchingLeft, relativeTo: anchorView, padding: padding, width: size, height: size)
view10.align(.ToTheLeftMatchingBottom, relativeTo: anchorView, padding: padding, width: size, height: size)
view11.align(.ToTheLeftCentered, relativeTo: anchorView, padding: padding, width: size, height: size)
view12.align(.ToTheLeftMatchingTop, relativeTo: anchorView, padding: padding, width: size, height: size)
```

![Align](Screenshots/align.png)
---



## Todo

- [ ] Finish initial implementation
- [ ] README documentation
- [ ] Code documentation
- [ ] Code coverage


## License

The source is made available under the MIT license. See LICENSE.txt for details.