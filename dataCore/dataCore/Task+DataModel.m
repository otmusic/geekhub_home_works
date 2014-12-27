//
//  Task+DataModel.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "Task+DataModel.h"
#import "DataModel.h"

@implementation Task (DataModel)

+ (BOOL) readTask:(Task *) task fromDictionary:(NSDictionary *) dict
{
	if ([DataModelBaseObject readBaseObject:task fromDictionary:dict])
	{
		task.name = [dict objectForKey:@"name"];
		
		NSArray * commentsArray = [dict objectForKey:@"comments"];
		NSMutableSet * newComments = [NSMutableSet setWithCapacity:[commentsArray count]];
		for (NSDictionary * commentDict in commentsArray)
		{
			Comment * comment = [[DataModel model] createNewComment];
			if ([Comment readComment:comment fromDictionary:commentDict]) [newComments addObject:comment];
			else [[DataModel model] deleteObject:comment];
		}
		
		[task setComments:newComments];
		[[DataModel model] saveContext];
		
		return YES;
	}
	return NO;
}

#ifdef DEBUG
- (NSString *) description
{
	return [NSString stringWithFormat:@"Task id = %@\nname = %@\n ",
			self.identifier,
			self.name
			];
}
#endif

@end