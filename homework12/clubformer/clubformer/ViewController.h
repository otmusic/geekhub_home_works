//
//  ViewController.h
//  clubformer
//
//  Created by Clubformer on 2/22/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <SCLAlertView.h>
#import "Subscription.h"
#import "SVPullToRefresh.h"

@interface ViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableView *masterTable;

@end

