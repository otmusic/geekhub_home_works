//
//  DetailViewController.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 20.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
	    self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"name"] description];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0){
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
		[self configureCell:cell atIndexPath:indexPath];
		return cell;
	} else if(indexPath.section == 1){
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
		[self configureCell:cell atIndexPath:indexPath];
		return cell;
	} else if(indexPath.section == 2){
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompletionCell" forIndexPath:indexPath];
		[self configureCell:cell atIndexPath:indexPath];
		return cell;
	}
	return nil;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0){
		cell.textLabel.text = [NSString stringWithFormat:@"Name: %@", [[self.detailItem valueForKey:@"name"] description]];
	} else if(indexPath.section == 1){
		cell.textLabel.text = [NSString stringWithFormat:@"Details: %@", [[self.detailItem valueForKey:@"comment"] description]];
	} else if(indexPath.section == 2){
		cell.textLabel.text = [NSString stringWithFormat:@"Completed: %@", [[self.detailItem valueForKey:@"completed"] description]];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
