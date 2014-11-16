//
//  AppDelegate.m
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "AppDelegate.h"
#import "DjTable.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	

	self.window = [[UIWindow alloc] init];
	self.window.frame = [UIScreen mainScreen].bounds;
	
	DjTable *controller = [[DjTable alloc] init];
	UINavigationController * navdj = [[UINavigationController alloc] initWithRootViewController:controller];
	
	self.window.rootViewController = navdj;
	
	[self.window makeKeyAndVisible];
	

	
	return YES;
}


@end
