ZGPullDragScrollView
====================

Awesome scrollView category to add PullDown and DragUp customization, light weigh yet powerful customization.

![img](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.23.23%20PM.png)
![img](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.23.44%20PM.png)


The cool thing about [ZGPullDragScrollView][] is that, the header and the footer view is a complete functional `UIView`,
over which you have complete control.

Is also super easy to use, the API is very thright forward.    

>It actually started with [ZGPullDragTableView][]. But Since `UITableView` subclass `UIScrollView`. make it `UIScrollView` compatable 
> in clearly a better choice.

After import `UIScrollView+ZGPullDrag.h` to you source file, `UITableView` will have two more method.

```
- (void)addZGPullView:(UIView *)pullView;
- (void)addZGDragView:(UIView *)dragView;
```

and also two more `Delegate`:

```
@property (nonatomic) id <ZGPullDragViewDelegate> pullDragDelegate;
```

all of its delegate method are optional.

```
@protocol ZGPullDragViewDelegate <NSObject>
@optional
//Push Down
- (void)pullView:(UIView *)pullView Show:(CGFloat )shownPixels ofTotal:(CGFloat )totalPixels;
- (void)pullView:(UIView *)pullView hangForCompletionBlock:(void (^)())completed;

//Drag Up
- (void)dragView:(UIView *)dragView Show:(CGFloat )showPixels ofTotal:(CGFloat )totalPixels;
- (void)dragView:(UIView *)dragView hangForCompletionBlock:(void (^)())completed;
@end
```

[![ScreenShot](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.30.47%20PM.png)](http://youtu.be/1LU7k563Cmo)


[ZGPullDragTableView]: https://github.com/zhigang1992/ZGPullDragTableView
[ZGPullDragScrollView]: https://github.com/zhigang1992/ZGPullDragScrollView

####Contact:
  * [@F_ZG](http://twitter.com/F_ZG)
  * zhigang1992@gmail.com


####Licsen-MIT
Copyright (C) 2012 by Kyle Fang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
