//
//  AlbumTable.m
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "AlbumTable.h"

@interface AlbumTable ()

@property (nonatomic, strong) NSDictionary * item;

@end

@implementation AlbumTable

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [AlbumTable sectionKeyForIndexPath:section];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
	return [_item count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[self sectionArrayForIndexPath:section] count];
}

- () sectionArrayForIndexPath:(NSInteger)section
{
	return [_item objectForKey:[AlbumTable sectionKeyForIndexPath:section]];
}


+ (NSString *) sectionKeyForIndexPath:(NSInteger)section
{
	switch (section) {
		case 0:
			return @"trance_album";
			break;
		case 1:
			return @"electro_album";
			break;
		default:
			break;
	}
	return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	const NSUInteger section = [indexPath section];
	const NSUInteger row = [indexPath row];
	
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"
															 forIndexPath:indexPath];
	
	cell.textLabel.text = [[self sectionArrayForIndexPath:section] objectAtIndex:row];
	
	return cell;
}

- (void) setupTableView
{
	[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
	
	[_tableView setDelegate:self];
	[_tableView setDataSource:self];
	
	[_tableView reloadData];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	[[self navigationItem] setTitle:NSStringFromClass([self class])];
	
	NSArray * trance_album = @[@"Mirage", @"The Sun", @"Imagine"];
	
	NSArray * electro_album = @[@"House Album", @"Tiesto House Album", @"Only House"];
	
	self.item = @{
				  @"trance_album": trance_album,
				  @"electro_album" : electro_album
				  
				  };
	
	[self setupTableView];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}




@end
