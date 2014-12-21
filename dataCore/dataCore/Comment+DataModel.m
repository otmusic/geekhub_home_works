//
//  Comment+DataModel.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "Comment+DataModel.h"

@implementation Comment (DataModel)

+ (BOOL) readComment:(Comment *) comment fromDictionary:(NSDictionary *) dict
{
	if ([DataModelBaseObject readBaseObject:comment fromDictionary:dict])
	{
		comment.comment = [dict objectForKey:@"comment"];
		return YES;
	}
	return NO;
}

@end
