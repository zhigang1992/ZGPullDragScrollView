//
//  DemoTableViewController.m
//  ZGPullDragTableView
//
//  Created by Kyle Fang on 2/26/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import "DemoTableViewController.h"

#import "UIScrollView+ZGPullDrag.h"

@interface DemoTableViewController () <ZGPullDragViewDelegate>

@end

@implementation DemoTableViewController

#pragma mark - 
#pragma mark - init Pull and Drag View

- (void)configPullDragView{
    
    //Any View would do.
    
    UIView *pullView = [[UIView alloc] initWithFrame:CGRectMake(-320, 0, 320, 80)];
    pullView.backgroundColor = [UIColor greenColor];
    pullView.alpha = 0;
    [self.tableView addZGPullView:pullView];
    
    UIView *dragView = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 80)];
    dragView.backgroundColor = [UIColor greenColor];
    dragView.alpha = 0;
    [self.tableView addZGDragView:dragView];
    
    
    self.tableView.pullDragDelegate = self;
}


#pragma mark -
#pragma mark - PullView Delegate

- (void)pullView:(UIView *)pullView Show:(CGFloat)shownPixels ofTotal:(CGFloat)totalPixels{
    
    //Do what ever you like with the pullView.
    //It updates with scrollViewDidScroll
    CGFloat progress = MIN(shownPixels / totalPixels, 1.f);
    pullView.alpha = progress;
    CGRect frame = pullView.frame;
    frame.origin.x = -320+320*progress;
    pullView.frame = frame;
}

- (void)pullView:(UIView *)pullView hangForCompletionBlock:(void (^)())completed{
    
    //Run completed() in 2 seconds
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        completed();
    });
}

#pragma mark - DragView Delegate

- (void)dragView:(UIView *)dragView Show:(CGFloat)showPixels ofTotal:(CGFloat)totalPixels{
    
    //Do what ever you like with the dragView
    //It updates with scrollViewDidScroll
    CGFloat progress = MIN(showPixels/totalPixels, 1.f);
    dragView.alpha = progress;
    CGRect frame = dragView.frame;
    frame.origin.x = 320-320*progress;
    dragView.frame = frame;
}

- (void)dragView:(UIView *)dragView hangForCompletionBlock:(void (^)())completed{
    
    //Run completed() in 2 seconds
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        completed();
    });
}



//=========================================================
//
//              Rest of Code is for demo purpose!
//
//=========================================================



//Make the button seperate invisible
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


//taggle between long and short list
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.numberOfSections == 1) {
        return 2;
    } else {
        return 1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configPullDragView];
}

@end
