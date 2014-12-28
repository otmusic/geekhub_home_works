//
//  ViewItemController.h
//  landingEvernote
//
//  Created by Alexandr Kharchenko on 28.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageItemController : UIViewController

@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;

@end
