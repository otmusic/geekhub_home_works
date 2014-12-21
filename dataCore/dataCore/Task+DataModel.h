//
//  Task+DataModel.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "Task.h"

@interface Task (DataModel)

+ (BOOL) readTask:(Task *) task fromDictionary:(NSDictionary *) dict;

@end
