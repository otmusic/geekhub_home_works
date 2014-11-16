//
//  TableViewsControllerViewController.h
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 16.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumTable.h"
#import "DjTable.h"

@interface TableViewsControllerViewController : UIViewController {
	AlbumTable * albums;
	DjTable * djs;
	IBOutlet UITableView *albumTable;
	IBOutlet UITableView *djTable;
}
@end
