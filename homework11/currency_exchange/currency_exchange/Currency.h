//
//  Currency.h
//  currency_exchange
//
//  Created by Dadits on 1/25/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property (nonatomic, strong) NSString *codeName;
@property (nonatomic, strong) NSString *codeNational;
@property (nonatomic, strong) NSString *buy;
@property (nonatomic, strong) NSString *sale;

-(void) saveToUserDefaults;

-(Currency*) initWithDictionary:(NSDictionary*)dictionaryObject;

@end
