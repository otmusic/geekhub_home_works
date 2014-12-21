//
//  Comment.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataModelBaseObject.h"

@class Task;

@interface Comment : DataModelBaseObject

@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) Task *task;

@end

#import "Comment+DataModel.h"