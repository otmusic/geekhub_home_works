//
//  EditViewController.m
//  dataCore
//
//  Created by Alexandr Kharchenko on 26.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.nameField setText:[NSString stringWithFormat:@"Name: %@", [[self.detailItem valueForKey:@"name"] description]]];
	[self.commentField setText:[self.detailItem valueForKey:@"comment"]];
}

- (BOOL)disablesAutomaticKeyboardDismissal {
	return YES;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)save:(id)sender {
	NSManagedObjectContext *context = [self managedObjectContext];
	
	if (self.detailItem) {
		[self.detailItem setValue:self.nameField.text forKey:@"name"];
		[self.detailItem setValue:self.commentField.text forKey:@"comment"];
//		[self.detailItem setValue:self.compleatedTask]
	}
	
	NSError *error = nil;
	if (![context save:&error]) {
		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
	}
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
