//
//  accountviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/26/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface accountviewcontroller : UIViewController
- (IBAction)btn_editaction:(id)sender;
- (IBAction)btn_changepwdaction:(id)sender;
- (IBAction)btn_backaction:(id)sender;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *view_account;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *view_accountpage;
- (IBAction)btn_logout:(id)sender;

@end
