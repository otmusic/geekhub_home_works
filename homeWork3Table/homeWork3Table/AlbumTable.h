//
//  AlbumTable.h
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTable : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView * tableView;

@end
