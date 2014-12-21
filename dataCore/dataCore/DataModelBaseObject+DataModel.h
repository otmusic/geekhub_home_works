//
//  DataModelBaseObject_DataModel.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DataModelBaseObject.h"

@interface DataModelBaseObject (DataModel)

+ (BOOL) readBaseObject:(DataModelBaseObject *) object fromDictionary:(NSDictionary *) dict;

@end