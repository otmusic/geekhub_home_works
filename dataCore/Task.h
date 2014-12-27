//
//  Task.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataModelBaseObject.h"

@class Comment;

@interface Task : DataModelBaseObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSNumber * compleated;

@property (nonatomic, retain) NSSet *comments;
@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end

#import "Task+DataModel.h"