//
//  TableViewsControllerViewController.m
//  homeWork3Table
//
//  Created by Alexandr Kharchenko on 16.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "TableViewsControllerViewController.h"

@interface TableViewsControllerViewController ()
@end

@implementation TableViewsControllerViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	if (albums == nil) {
		albums = [[AlbumTable alloc] init];
	}
	if (djs == nil) {
		djs = [[DjTable alloc] init];
	}
	
	[albumTable setDataSource:albums];
	[djTable setDataSource:djs];
	
	[albumTable setDelegate:albums];
	[djTable setDelegate:djs];
	
	albums.view = albums.tableView;
	djs.view = djs.tableView;
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


//- (void)dealloc {
//	[albums release];
//	[djs release];
//	[albumTable release];
//	[djTable release];
//	[super dealloc];
//}


@end
