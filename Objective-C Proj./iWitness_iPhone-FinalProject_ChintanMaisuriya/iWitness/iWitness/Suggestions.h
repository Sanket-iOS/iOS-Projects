//
//  Suggestions.h
//  iWitness
//
//  Created by MACOS on 6/28/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Suggestions : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *getPSDetails;
    NSMutableArray *getPSName;
    NSString *strGetPSName;
    NSString *strGetUID;
    NSString *strGetPSID;
    NSString *checkStatus;
}

@property (weak, nonatomic) IBOutlet UIView *viewSuggestions;
@property (weak, nonatomic) IBOutlet UITextField *txtfSetPS;
@property (weak, nonatomic) IBOutlet UIButton *imgSelectPS;

@property (weak, nonatomic) IBOutlet UILabel *lblPlaceHolderText;
@property (weak, nonatomic) IBOutlet UITextField *txtfSuggetionSubject;
@property (weak, nonatomic) IBOutlet UITextView *txtviewSuggetions;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;

@property (weak, nonatomic) IBOutlet UIView *viewPS;
@property (weak, nonatomic) IBOutlet UILabel *sublbl;
@property (weak, nonatomic) IBOutlet UIPickerView *pickPS;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (weak, nonatomic) IBOutlet UIButton *btnSendSuggestion;


- (IBAction)imgSelectPS:(id)sender;
- (IBAction)btnSelect:(id)sender;
- (IBAction)btnCancel:(id)sender;
- (IBAction)btnSendSuggestion:(id)sender;





@end
