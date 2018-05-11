//
//  HomeTab.h
//  iWitness
//
//  Created by MACOS on 6/20/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTab : UIViewController{
    BOOL check;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnProfile;
@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet UIButton *btnDetailProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnResetPWD;
@property (weak, nonatomic) IBOutlet UIButton *btnSignOut;

@property (weak, nonatomic) IBOutlet UILabel *lblUName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuList;

@property (weak, nonatomic) IBOutlet UIButton *btnComplaint;
@property (weak, nonatomic) IBOutlet UIButton *btnComplaintStatus;
@property (weak, nonatomic) IBOutlet UIButton *btnMPs;
@property (weak, nonatomic) IBOutlet UIButton *btnWPs;
@property (weak, nonatomic) IBOutlet UIButton *btnSuggestions;
@property (weak, nonatomic) IBOutlet UIButton *btnFeedbacks;

- (IBAction)btnProfile:(id)sender;
- (IBAction)btnDetailProfile:(id)sender;
- (IBAction)btnResetPWD:(id)sender;
- (IBAction)btnSignOut:(id)sender;

- (IBAction)btnComplaint:(id)sender;
- (IBAction)btnComplaintStatus:(id)sender;
- (IBAction)btnMPs:(id)sender;
- (IBAction)btnWPs:(id)sender;
- (IBAction)btnSuggestions:(id)sender;
- (IBAction)btnFeedbacks:(id)sender;

@end
