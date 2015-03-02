//
//  Currency.m
//  currency_exchange
//
//  Created by Dadits on 1/25/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "Currency.h"

@implementation Currency

-(Currency*) initWithDictionary:(NSDictionary*)dictionaryObject{
    self.codeName = [dictionaryObject valueForKey:@"ccy"];
    self.codeNational =[dictionaryObject valueForKey:@"base_ccy"];
    self.buy =[dictionaryObject valueForKey:@"buy"];
    self.sale =[dictionaryObject valueForKey:@"sale"];
    return self;
}


- (void) saveToUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    //    info[@"Bid"] = self.Bid;
    //    info[@"BidRealtime"] = self.BidRealtime;
    //
    //    [defaults setObject:info forKey:self.Name];
    //    [defaults synchronize];
}

@end
