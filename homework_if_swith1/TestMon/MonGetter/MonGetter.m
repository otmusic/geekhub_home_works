//
//  MonGetter.m
//  TestMon
//
//  Created by Alexandr Kharchenko on 23.10.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "MonGetter.h"
#import "MonGetterCase.h"
#import "MonGetterIf.h"

@implementation MonGetter

- (NSString *) getMon:(int) m
{
	NSLog(@"Getting mon via MonGetter");
	
	return nil;
}

+ (MonGetter *) createGetter
{
	
	int randomNumber = arc4random_uniform(2);
	NSLog(@"Random %i", randomNumber);
	
	switch (randomNumber)
	{
		case 0: 
		{
			return [[MonGetterIf alloc] init];
		}
			break;
			
			
			
		case 1:
		{
			return [[MonGetterCase alloc] init];
		}
			break;
			
			
			
		default: break;
	}
	
	return nil;
}

@end
