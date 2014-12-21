//
//  Comment+DataModel.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "Comment.h"

@interface Comment (DataModel)

+ (BOOL) readComment:(Comment *) comment fromDictionary:(NSDictionary *) dict;

@end
