//
//  UIScrollView+ZGPullDrag.h
//  ZGPullDragScrollView
//
//  Created by Kyle Fang on 2/26/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZGPullDragViewDelegate <NSObject>
@optional
//Push Down
- (void)pullView:(UIView *)pullView Show:(CGFloat )shownPixels ofTotal:(CGFloat )totalPixels;
- (void)pullView:(UIView *)pullView hangForCompletionBlock:(void (^)())completed;

//Drag Up
- (void)dragView:(UIView *)dragView Show:(CGFloat )showPixels ofTotal:(CGFloat )totalPixels;
- (void)dragView:(UIView *)dragView hangForCompletionBlock:(void (^)())completed;
@end

@interface UIScrollView (ZGPullDrag)
- (void)addZGPullView:(UIView *)pullView;
- (void)addZGDragView:(UIView *)dragView;
@property (nonatomic) id <ZGPullDragViewDelegate> pullDragDelegate;
@end
