//
//  MonGetterIf.m
//  TestMon
//
//  Created by Alexandr Kharchenko on 23.10.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "MonGetterIf.h"

@implementation MonGetterIf

- (NSString *) getMon:(int) m
{
	NSLog(@"Getting mon via MonGetterIf");
	
	for (int i = 0; i < 12; i++) {
		if (i == 0) {
			NSLog(@"January");
		} else if (i == 1) {
			NSLog(@"February");
		} else if (i == 2) {
			NSLog(@"March");
		} else if (i == 3) {
			NSLog(@"April");
		} else if (i == 4) {
			NSLog(@"May");
		} else if (i == 5) {
			NSLog(@"June");
		} else if (i == 6) {
			NSLog(@"July");
		} else if (i == 7) {
			NSLog(@"August");
		} else if (i == 8) {
			NSLog(@"September");
		} else if (i == 9) {
			NSLog(@"October");
		} else if (i == 10) {
			NSLog(@"November");
		} else if (i == 11) {
			NSLog(@"December");
		}
	};

	return nil;
}

@end
