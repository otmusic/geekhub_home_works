//
//  ViewController.m
//  landingEvernote
//
//  Created by Alexandr Kharchenko on 26.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "ViewController.h"
#import "PageItemController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *contentImages;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation ViewController
@synthesize contentImages;

#pragma mark -
#pragma mark View Lifecycle

- (void) viewDidLoad
{
	[super viewDidLoad];
	[self createPageViewController];
	[self setupPageControl];
}

- (void) createPageViewController
{
	contentImages = @[@"armin.png",
					  @"alyfila.png",
					  @"bryankearney.png"];
	
	UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier: @"PageController"];
	pageController.dataSource = self;
	
	if([contentImages count])
	{
		NSArray *startingViewControllers = @[[self itemControllerForIndex: 0]];
		[pageController setViewControllers: startingViewControllers
								 direction: UIPageViewControllerNavigationDirectionForward
								  animated: NO
								completion: nil];
	}
	
	self.pageViewController = pageController;
	[self addChildViewController: self.pageViewController];
	[self.view addSubview: self.pageViewController.view];
	[self.pageViewController didMoveToParentViewController: self];
}

- (void) setupPageControl
{
	[[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
	[[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
	[[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
}

#pragma mark -
#pragma mark UIPageViewControllerDataSource

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(UIViewController *) viewController
{
	PageItemController *itemController = (PageItemController *) viewController;
	
	if (itemController.itemIndex > 0)
	{
		return [self itemControllerForIndex: itemController.itemIndex-1];
	}
	
	return nil;
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(UIViewController *) viewController
{
	PageItemController *itemController = (PageItemController *) viewController;
	
	if (itemController.itemIndex+1 < [contentImages count])
	{
		return [self itemControllerForIndex: itemController.itemIndex+1];
	}
	
	return nil;
}

- (PageItemController *) itemControllerForIndex: (NSUInteger) itemIndex
{
	if (itemIndex < [contentImages count])
	{
		PageItemController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier: @"ItemController"];
		pageItemController.itemIndex = itemIndex;
		pageItemController.imageName = contentImages[itemIndex];
		return pageItemController;
	}
	
	return nil;
}

#pragma mark -
#pragma mark Page Indicator

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
	return [contentImages count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
	return 0;
}
@end
