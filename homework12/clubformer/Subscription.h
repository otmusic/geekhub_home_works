//
//  Subscription.h
//  clubformer
//
//  Created by Dadits on 2/22/15.
//  Copyright (c) 2015 Clubformer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Subscription : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSDate * subscription_date;

@end
