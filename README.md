# LayoutGrouping

[![Build Status](https://travis-ci.com/stuaustin/LayoutGrouping.svg?branch=master)](https://travis-ci.com/stuaustin/LayoutGrouping) [![Coverage Status](https://coveralls.io/repos/github/stuaustin/LayoutGrouping/badge.svg?branch=master)](https://coveralls.io/github/stuaustin/LayoutGrouping?branch=master)

A simple extension of Apple's layout anchors, without any complicated abstractions or inner workings.

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate LayoutGrouping into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
pod 'LayoutGrouping', '~> 1.0.0'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate LayoutGrouping into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "stuaustin/LayoutGrouping" ~> 1.0.0
```

## Usage

### Size anchors
Size anchors combine the widthAnchor and heightAnchor into one. These are used to define size relationships as if they were a single constraint

```
NSLayoutConstraint.activate([
	viewA.sizeAnchor.constraints(equalTo: viewB.sizeAnchor)
	])
```

You can also use relative constraints as well

```
NSLayoutConstraint.activate([
	viewA.sizeAnchor.constraints(greaterThanOrEqualTo: viewB.sizeAnchor),
	viewC.sizeAnchor.constraints(lessThanOrEqualTo: viewD.sizeAnchor)
	])
```

### Position anchors
Position anchors combine one horizontal anchor and one vertical anchor. These allow you to define relationships between two layout items for both axes as if they were a single constraint

```
NSLayoutConstraint.activate([
	viewA.centerYCenterXAnchor.constraints(equalTo: viewB.centerYCenterXAnchor),
	])
```
You can also use relative constraints as well

```
NSLayoutConstraint.activate([
	viewA.topLeadingAnchor.constraints(greaterThanOrEqualTo: viewB.bottomTrailingAnchor),
	viewC.centerYTrailingAnchor.constraints(lessThanOrEqualTo: viewD.topLeftAnchor)
	])
```

### Box anchors
Box anchors combine the top, bottom, leading, and trailing anchors. These allow you to define a layout item as being identical, contained inside, or outside of another layout item.

```
let viewA = UIView()
view.addSubview(viewA, useAutoLayout: true)

let viewB = UIView()
view.addSubview(viewB, useAutoLayout: true)

NSLayoutConstraint.activate([
	viewA.boxAnchor.constraints(equalTo: viewB.boxAnchor),
	viewC.boxAnchor.constraints(insideOfOrEqualTo: viewD.boxAnchor),
	viewE.boxAnchor.constraints(outsideOfOrEqualTo: viewF.boxAnchor)
	])
```

### NSLayoutConstraint activate() with UILayoutPriority

LayoutGrouping allows you to simultaneously active an array of constraints (or ConstraintGroups), and specify a `UILayoutPriority` for those constraints. This saves you needing to store constraints in variables temporarily in order to change the priorities.

```
NSLayoutConstraint.activate([
	viewA.leadingAnchor.constraint(equalTo: viewB.trailingAnchor),
	viewB.leadingAnchor.constraint(equalTo: viewC.trailingAnchor)
	], priority: .defaultLow)
```

### UIEdgeInset initializers

LayoutGrouping defines a complete set of UIEdgeInsets initializers, allowing you to initialize UIEdgeInset with any combination of missing insets.

```
let insetsBottom = UIEdgeInsets(bottom: 13)
let insetsTopRight = UIEdgeInsets(top: 10, right: 4)

NSLayoutConstraint.activate([
	viewA.boxAnchor.constraints(insideOfOrEqualTo: view.boxAnchor, constant: UIEdgeInsets(top: 10))
	])
```

### UIOffset initializers

LayoutGrouping defines two additional UIOffset initializers, allowing you to specify just the vertical or just the horiziontal offset.

```
let offsetVertical = UIOffset(vertical: 10)

NSLayoutConstraint.activate([
	viewA.topLeadingAnchor.constraints(equalTo: view.topLeadingAnchor, constant: UIOffset(horizontal: 20))
	])
```

### UIView subview additions
LayoutGrouping provides 3 new functions for adding subviews, and simultaneously specifying that you want to use AutoLayout for these subviews, instead of having to manually set `translatesAutoresizingMaskIntoConstraints`.

The below will add `subviewA` as a subview to `view`, and set `subviewA.translatesAutoresizingMaskIntoConstraints` to `false` 

```
let view = UIView()
let subviewA = UIView()
view.addSubview(subviewA, useAutoLayout: true)
```

There is a similar function for inserting below a sibling subview:

```
let subviewB = UIView()
view.insertSubview(subviewB, belowSubview: subviewA, useAutoLayout: true)
```

And a similar function for inserting above a sibling subview:

```
let subviewC = UIView()
view.insertSubview(viewC, aboveSubview: subviewB, useAutoLayout: false)
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
