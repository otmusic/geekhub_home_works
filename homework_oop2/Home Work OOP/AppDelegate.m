//
//  AppDelegate.m
//  Home Work OOP
//
//  Created by Sergey Zalozniy on 10/31/14.
//  Copyright (c) 2014 Sergey Zalozniy. All rights reserved.
//

#import "GHCar.h"

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    GHCar *car1 = [[GHCar alloc] initWithEngineCapacity:2.5 andHorsePower:192];
    car1.topSpeed = 230.0;
    car1.mark = @"BMW";
    [car1 printCarIformation];
    
    GHCar *car2 = [[GHCar alloc] initWithEngineCapacity:2.4 andHorsePower:180];
    car2.topSpeed = 225.0;
    car2.mark = @"Audi";
    [car2 printCarIformation];
    
    if ([car1 isFasterThanCar:car2]) {
        NSLog(@"%@ is faster. speed - %0.0f", car1.mark, car1.topSpeed);
    } else {
        NSLog(@"%@ is faster. speed - %0.0f", car2.mark, car2.topSpeed);
    }
    
    
    return YES;
}

@end
