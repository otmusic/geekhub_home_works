//
//  TablesViewDelegate.m
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "TablesViewDelegate.h"

@implementation TablesViewDelegate

- (id) initWithTables
{
	self = [super init];
	
	if (self)
	{
		DjTable * dj = [[DjTable alloc] init];
		AlbumTable * album = [[AlbumTable alloc] init];
		
		_djTable = dj;
		_albumTable = album;
		
	}
	return self;
}

@end
