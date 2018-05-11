//
//  ChangePassword.h
//  iWitness
//
//  Created by MACOS on 7/6/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePassword : UIViewController
{
    NSString *strGetUID;
    NSString *strGetUOpwd;
}
@property (weak, nonatomic) IBOutlet UIView *viewChangePWD;
@property (weak, nonatomic) IBOutlet UITextField *txtOldPWD;
@property (weak, nonatomic) IBOutlet UITextField *txtNewPWD;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmNewPWD;
@property (weak, nonatomic) IBOutlet UIButton *btnChangePWD;

- (IBAction)btnChangePWD:(id)sender;

@end
