//
//  MonGetterIf.h
//  TestMon
//
//  Created by Alexandr Kharchenko on 23.10.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonGetter.h"

@interface MonGetterIf : MonGetter

/// overrided
- (NSString *) getMon:(int) m;

@end
