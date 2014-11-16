//
//  DjTable.m
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 15.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DjTable.h"
#import "AlbumTable.h"

@interface DjTable () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSDictionary * item;

@end

@implementation DjTable

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [DjTable sectionKeyForIndexPath:section];
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
	return [_item objectForKey:[DjTable sectionKeyForIndexPath:section]];
}


+ (NSString *) sectionKeyForIndexPath:(NSInteger)section
{
	switch (section) {
		case 0:
			return @"trance_dj";
			break;
		case 1:
			return @"electro_dj";
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
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
	
	[self.tableView setDelegate:self];
	[self.tableView setDataSource:self];
	
	[self.tableView reloadData];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	[[self navigationItem] setTitle:NSStringFromClass([self class])];
	
	NSArray * trance_dj = @[@"Bryan Kearney", @"Armin van Buuren", @"Josh O'callaghan"];
	
	NSArray * electro_dj = @[@"Hardwell", @"Tiesto", @"Afrojack"];
	
	self.item = @{
				  @"trance_dj": trance_dj,
				  @"electro_dj" : electro_dj
				  
				  };
	
	[self setupTableView];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	AlbumTable * AlbumTableToShow = nil;
	UIStoryboard * whereVCIsPlaced = nil;
	NSBundle * whereStoryBoardIsPlaced = nil;
	
	whereStoryBoardIsPlaced = [NSBundle mainBundle];
	whereVCIsPlaced = [UIStoryboard storyboardWithName:@"Main" bundle:whereStoryBoardIsPlaced];
	AlbumTableToShow = [whereVCIsPlaced instantiateViewControllerWithIdentifier:NSStringFromClass([AlbumTable class])];
	
	
	[[self navigationController] pushViewController:AlbumTableToShow animated:YES];
}

@end
