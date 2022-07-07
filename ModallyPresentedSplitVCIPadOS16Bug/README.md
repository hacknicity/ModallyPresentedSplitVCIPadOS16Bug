#  Modally-Presented UISplitViewController iPadOS 16 bug

In iPadOS 16.0 beta, a modall-presented double-column split view controller's primary view controller is the wrong width. The issue is also present in the primary view controller of a modally-presented triple-column split view (not included in this sample code).

This sample project has a double-column split view controller as its root primary and secondary view controllers which display the width and height of the view controller. The issue is best seen in landscape (as that will show both primary and secondary), but the width of the primary view controller is not orientiation-dependent.

The root primary view controller has buttons to modally present another double-column split view controller with different presentation styles: automatic, full screen, form sheet and page sheet.

I have tested this with 11" and 12.9" iPad simulators on iOS 15 and 16 and with a physical 12.9" iPadOS running iPadOS 16.0 beta 3 (the latest version at the time of writing). The same problem was in beta 1 and 2.

The primary view controller of a split view controller is 100pt wider than the visible size. This is to provide over-scrolling when swiping to the right. An increased leading margin in the layout margin accounts for this. My code adjusts for this and the size it reports is what you see on screen. The sizes reported below also ignore the overscrolling and reflect what is visible on screen.


## iPadOS 15
Root split view controller has primary view controller width of 320pt.

An automatic presentation of a split view controller fills the width (a special adaption just for split view controllers). It is slightly less tall than full screen to give the familiar iOS 13 card-like appearance. The primary view controller width is 320pt.

A full screen presentation fills the entire screen and the primary view controller width is 320pt.

A form sheet presentation is compact width and shows just once view controller at once (expected). It is 540x620pt, like any other form sheet.

A page sheet presentation is also compact width and (at default Dynamic Type Size) is 704pt wide. The height depends on the device size.


## iPadOS 16
Root split view controller has primary view controller width of 320pt, just like iPadOS 15.

ISSUE 1: An Xcode 13 build of this sample app executed on an iPad running iPadOS 16 shows a slightly different issue. An split view controller presented with the automatic style does correctly adapt and fill the width with a card-like appearance. However, the primary view controller is 240pt wide when I would expect 320pt.

The remainder of these issues occur when building with Xcode 14.  

ISSUE 2: An automatic presentation does not fill with width. The special adaption for modally-presented split view controllers that existed in iPadOS 13-15 is not working in iPadOS 16. This presentation shows both primary and secondary view controllers (which it should if it were full width). The primary view controller is only 240pt wide (it should be 320pt).

A full screen presentation correctly fills the entire screen and the primary view controller width is 320pt.

ISSUE 3: A form sheet presentation shows both primary and secondary view controllers (iPadOS 15 showed only one). Again, the primary is 240pt wide when it should be 320pt.

ISSUE 4: A page sheet presentation also shows both primary and secondary view controllers (iPadOS 15 showed only one). Again, the primary is 240pt wide when it should be 320pt.
