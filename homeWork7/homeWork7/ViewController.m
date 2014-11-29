//
//  ViewController.m
//  homeWork7
//
//  Created by Alexandr Kharchenko on 27.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

@synthesize changeButton;
@synthesize changeTextLabel;

@synthesize segmentController;
@synthesize segmentLabel;

@synthesize inputText;
@synthesize inputLabel;

@synthesize scrollView;

@synthesize horizontalSlider;
@synthesize sliderLabel;

@synthesize loaderImg;

@synthesize stepper;
@synthesize stepperLabel;

@synthesize imageSrc;

- (void)viewDidLoad {
	[super viewDidLoad];
	scrollView.contentSize = CGSizeMake(320.0f, 800.0f);
}

- (IBAction)changeSegmentController:(id)sender
{
	if (segmentController.selectedSegmentIndex == 0) {
		segmentLabel.text = @"Armin van Buuren";
	} else if (segmentController.selectedSegmentIndex == 1) {
		segmentLabel.text = @"Bryan Kearney";
	}
}

- (IBAction)changeButtonClickd
{
	changeTextLabel.text = @"Trance";
}

- (IBAction)inputTextChanged:(id)sender
{
	[inputText addTarget:self action:@selector(textFieldShouldEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
	inputLabel.text = inputText.text;
}

- (IBAction)sliderValueChanged:(id)sender
{
	sliderLabel.text = [NSString stringWithFormat:@"Volume %0.0f", (horizontalSlider.value *100)];
}

- (IBAction)changeSwitchers:(id)sender
{
	UIAlertView *switcherAlert = [[UIAlertView alloc] initWithTitle:@"Who is afrade of 138?!" message:@"Uplifting!!" delegate:self cancelButtonTitle:@"Go" otherButtonTitles:@"No", nil];
	[switcherAlert show];
}

- (IBAction)loaderLabelClick
{
	[loaderImg startAnimating];
}

- (IBAction)stepperChanged
{
	NSString *value = [@(stepper.value) stringValue];
	stepperLabel.text = value;
}

- (IBAction)imageLabelClick
{
	imageSrc.image = [UIImage imageNamed:@"wao138.jpg"];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
