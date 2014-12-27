//
//  EditViewController.h
//  dataCore
//
//  Created by Alexandr Kharchenko on 26.12.14.
//  Copyright (c) 2014 Alexandr Kharchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EditViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;



@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *commentField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UISwitch *compleatedTask;
@property (weak, nonatomic) IBOutlet UIButton *taskSaveButton;



@end
