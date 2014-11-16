//
//  TablesViewDelegate.h
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DjTable.h"
#import "AlbumTable.h"

@interface TablesViewDelegate : NSObject

@property (nonatomic, readonly) DjTable * djTable;
@property (nonatomic, readonly) AlbumTable * albumTable;

- (id) initWithTables;

@end
