//
//  AdminView.h
//  Expense
//
//  Created by mac on 4/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminView : UIViewController
{
    NSMutableArray * arrUser;
}
@property (weak, nonatomic) IBOutlet UITextField *adminUserBox;

@property (weak, nonatomic) IBOutlet UITextField *adminPassBox;
- (IBAction)adminLogin:(id)sender;
- (IBAction)Clear:(id)sender;


@end
