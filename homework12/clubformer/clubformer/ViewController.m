//
//  ViewController.m
//  clubformer
//
//  Created by Clubformer on 2/22/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "ViewController.h"
#import "Subscription.h"

@interface ViewController ()
{
    NSMutableArray *_savedSubscribersData;
    NSString *requestUrl;
    NSString *apiToken;
    AFHTTPRequestOperationManager *manager;
    SCLAlertView *alert;
}
@end

@implementation ViewController
@synthesize masterTable = masterTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    manager = [AFHTTPRequestOperationManager manager];
    self.title = @"Clubformer Subscribers";
    
    _savedSubscribersData = [NSMutableArray new];
    requestUrl = @"http://clubformerlanding.herokuapp.com/api/v1/subscriptions/all";
    apiToken = @"b602c108-18df-484f-ac0c-a6dad3674925";
    
    [self refreshData];
    
    [self.masterTable addPullToRefreshWithActionHandler:^{
        [self startSubscriptionsUpload];
    }];
    
    alert = [[SCLAlertView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (void)startSubscriptionsUpload {
    if (![self connected]) {
        [alert showError:self title:@"Connection Error" subTitle:@"Please connect to the internet." closeButtonTitle:@"OK" duration:0.0f];
        [self.tableView.pullToRefreshView stopAnimating];
    } else {
        [self getData];
        [self.tableView.pullToRefreshView stopAnimating];
    }
}


//Create new entity and set properties
-(void)saveSubscription:(NSString *)email {
    
    Subscription *savedSub = [Subscription MR_findFirstByAttribute:@"email" withValue:email];
    if (!savedSub) {
        //Init subscription
        Subscription *newSubscription = [Subscription MR_createEntity];
        newSubscription.email = email;
        newSubscription.subscription_date = [NSDate date];
        
        //Save to persistant storage
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

-(NSArray *)getEmailsFrom:(NSArray *)result {
    NSMutableArray *emails = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *dic in result)
    {
        NSString* email= dic[@"email"];
        [emails addObject:email];
    }
    return emails;
}

-(void)getData {
    NSDictionary *params = @{@"api_token": apiToken};
    [manager GET:requestUrl parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseData) {
             NSArray *responseEmails = [self getEmailsFrom:responseData];
             for (NSString *email in responseEmails) {
                 [self saveSubscription:email];
             }
             [self refreshData];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [alert showError:self title:@"Oops" subTitle:@"Something went wrong" closeButtonTitle:@"OK" duration:0.0f];
         }];
}

#pragma mark - Refresh
-(void) refreshData {
    [_savedSubscribersData removeAllObjects];
    NSArray *allRecords = [Subscription MR_findAllSortedBy:@"subscription_date" ascending:NO];
    [_savedSubscribersData addObjectsFromArray:allRecords];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_savedSubscribersData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // Configure the cell...
    Subscription *sub = [_savedSubscribersData objectAtIndex:indexPath.row];
    cell.textLabel.text = sub.email;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-YY HH:mm:ss"];
    NSString *subDate = [dateFormatter stringFromDate:sub.subscription_date];
    cell.detailTextLabel.text = subDate;
    
    return cell;
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
