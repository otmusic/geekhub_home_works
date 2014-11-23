//
//  DeviceDetailsViewController.m
//  HomeWork6TableView
//
//  Created by Alexandr Kharchenko on 22.11.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import "DeviceDetailsViewController.h"

@interface DeviceDetailsViewController ()

@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, assign) UIWebView *webView;

@end

@implementation DeviceDetailsViewController

- (instancetype) initWithDeviceName:(NSString *)deviceName
{
	self = [super initWithNibName:nil bundle:nil];
	if (!self) {
		return nil;
	}
	
	_deviceName = deviceName;
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:webView];
	self.webView = webView;
	[webView release];
	
	NSString *urlPath = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", self.deviceName];
	urlPath = [urlPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSURL *url = [NSURL URLWithString:urlPath];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
	
	return self;
}

- (void) dealloc
{
	self.deviceName = nil;
	
	[super dealloc];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	self.title = self.deviceName;
}


@end
