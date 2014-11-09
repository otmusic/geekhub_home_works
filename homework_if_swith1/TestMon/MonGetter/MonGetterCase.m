//
//  MonGetterCase.m
//  TestMon
//
//  Created by Alexandr Kharchenko on 23.10.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "MonGetterCase.h"

@implementation MonGetterCase

/// overrided
- (NSString *) getMon:(int) m
{
	NSLog(@"Getting mon via MonGetterCase");
	
	typedef enum {
		January, February, March, April, May, June, July, August, September, October, November, December
	} Months;
	
	for (int i = 1; i < 12; i++) {
		Months month = (Months) i;
		switch (month)
		{
			case January:
				NSLog(@"January");
				break;
			case February:
				NSLog(@"February");
				break;
			case March:
				NSLog(@"March");
				break;
			case April:
				NSLog(@"April");
				break;
			case May:
				NSLog(@"May");
				break;
			case June:
				NSLog(@"June");
			case July:
				NSLog(@"July");
				break;
			case August:
				NSLog(@"August");
				break;
			case September:
				NSLog(@"September");
				break;
			case October:
				NSLog(@"October");
				break;
			case November:
				NSLog(@"November");
				break;
			case December:
				NSLog(@"December");
				break;
		}
	};

	return nil;
}

@end
