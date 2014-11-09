//
//  GHCar.m
//  Home Work OOP
//
//  Created by Sergey Zalozniy on 10/31/14.
//  Copyright (c) 2014 Sergey Zalozniy. All rights reserved.
//

#include "GHCar.h"

@implementation GHCar

- (id) initWithEngineCapacity:(float)capacity andHorsePower:(int)horsePower
{
	self = [super init];
	if (self)
	{
		GHEngine * newEngine = [[GHEngine alloc] init];
		newEngine.capacity = capacity;
		newEngine.horsePower = horsePower;
		
		_engine = newEngine;
	}
	return self;
}


- (void) printCarIformation
{
	NSLog(@"%@ (%.01f) - %i h/p, max. speed - %.0f", self.mark,
													 [_engine capacity],
			                                         _engine.horsePower,
		                                             self.topSpeed);
}

- (BOOL) isFasterThanCar:(GHCar *)carToCompare
{
	return self.topSpeed > carToCompare.topSpeed;
}

@end
