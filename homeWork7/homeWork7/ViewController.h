//
//  ViewController.h
//  homeWork7
//
//  Created by Alexandr Kharchenko on 27.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView * scrollView;

@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (weak, nonatomic) IBOutlet UILabel *changeTextLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UILabel *segmentLabel;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel;

@property (weak, nonatomic) IBOutlet UISlider *horizontalSlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@property (strong, nonatomic) UIAlertView *switcherAlert;

@property (weak, nonatomic) IBOutlet UIButton *loaderLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loaderImg;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;

@property (weak, nonatomic) IBOutlet UIButton *imageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageSrc;

- (IBAction)changeButtonClickd:(id)sender;

- (IBAction)changeSegmentController:(id)sender;

- (IBAction)inputTextChanged:(id)sender;

- (IBAction)loaderLabelClick:(id)sender;

- (IBAction)stepperChanged:(id)sender;

- (IBAction)imageLabelClick:(id)sender;

@end

