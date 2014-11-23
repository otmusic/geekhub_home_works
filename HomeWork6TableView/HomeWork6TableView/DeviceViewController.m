//
//  DeviceViewController.m
//  HomeWork6TableView
//
//  Created by Alexandr Kharchenko on 22.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DeviceDetailsViewController.h"


#import "DeviceViewController.h"

@interface DeviceViewController () <UITableViewDelegate>

@property (nonatomic, strong) NSArray *mobileItems;
@property (nonatomic, strong) NSArray *tabletItems;

@end

NSString *const MobileCellIdentifier = @"IPhoneCellIdentifier";
NSString *const TabletCellIdentifier = @"IPadCellIdentifier";

@implementation DeviceViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	_mobileItems = [[NSArray alloc] initWithObjects:@"iPhone", @"iPhone 3G", @"iPhone 4", @"iPhone 5", @"Iphone 5S", @"Iphone 6", @"iPhone 6 Plus", nil];
	_tabletItems = [[NSArray alloc] initWithObjects:@"iPad 2", @"iPad 3", @"iPad 4", @"iPad Air", nil];
	
	UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:tableView];
	[tableView setDataSource:self];
	[tableView setDelegate:self];
	[tableView release];
	
	[self setTitle:@"Devices"];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSString *cellId;
	
	if (indexPath.section == 0) {
		cellId = MobileCellIdentifier;
	} else {
		cellId = TabletCellIdentifier;
	}
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	
	NSString *title;
	if (indexPath.section == 0) {
		title = [_mobileItems objectAtIndex:indexPath.row];
	} else {
		title = [_tabletItems objectAtIndex:indexPath.row];
	}
	
	[[cell textLabel] setText:title];
	
	return cell;
}

- (void) dealloc
{
	[_mobileItems release];
	[_tabletItems release];
	
	[super dealloc];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return [_mobileItems count];
	} else {
		return [_tabletItems count];
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
		return @"Mobiles";
	} else {
		return @"Tablets";
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
	NSString *deviceName = selectedCell.textLabel.text;
	
	DeviceDetailsViewController *detailsController = [[DeviceDetailsViewController alloc] initWithDeviceName:deviceName];
	[self.navigationController pushViewController:detailsController animated:YES];
	[detailsController release];
}

@end
