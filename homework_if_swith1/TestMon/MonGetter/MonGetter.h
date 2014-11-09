//
//  MonGetter.h
//  TestMon
//
//  Created by Alexandr Kharchenko on 23.10.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonGetter : NSObject

- (NSString *) getMon:(int) m;

+ (MonGetter *) createGetter;

@end


// C
//static MonGetter * createGetter();
