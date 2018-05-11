//
//  Feedbacks.h
//  iWitness
//
//  Created by MACOS on 7/1/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDStarRating.h"

@interface Feedbacks : UIViewController<EDStarRatingProtocol,UITextViewDelegate>{

    NSString *strGetUID;
}
@property (weak, nonatomic) IBOutlet UIView *viewFeedback;
@property (weak, nonatomic) IBOutlet UILabel *lblPlaceHolderText;
@property (weak, nonatomic) IBOutlet UITextView *txtviewFeedbacks;
@property (weak, nonatomic) IBOutlet EDStarRating *ratingview;
@property (weak, nonatomic) IBOutlet UIButton *btnSendFeedback;

@property (strong, nonatomic) UIBarButtonItem *button;
@property (assign, nonatomic) BOOL setFlag;

- (IBAction)btnSendFeedback:(id)sender;

@end
