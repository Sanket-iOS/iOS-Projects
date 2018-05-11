//
//  ViewController.h
//  Expense
//
//  Created by tops on 2/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawPatternLockViewController.h"
@interface ViewController : UIViewController
{
    NSMutableArray *arrUser;
}

- (IBAction)Login:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *PassBox;



@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UITextField *EmailBox;
@property (weak, nonatomic) IBOutlet UITextField *incomeBox;



@end
