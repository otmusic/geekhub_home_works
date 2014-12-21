//
//  DataModelBaseObject_DataModel.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DataModelBaseObject+DataModel.h"

@implementation DataModelBaseObject (DataModel)

+ (BOOL) readBaseObject:(DataModelBaseObject *) object fromDictionary:(NSDictionary *) dict
{
	if (dict && object)
	{
		object.identifier = [dict objectForKey:@"id"];
		object.createdAt = [dict objectForKey:@"created_at"];
		return YES;
	}
	return NO;
}

@end
