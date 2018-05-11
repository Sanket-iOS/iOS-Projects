//
//  InnerPetitionViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InnerPetitionViewController : UIViewController
- (IBAction)btnSign:(id)sender;
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSString *petid;
@property(retain,nonatomic)NSMutableArray *ardata;
@property (weak, nonatomic) IBOutlet UILabel *lbltitle;
@property (weak, nonatomic) IBOutlet UILabel *lblagainst;
@property (weak, nonatomic) IBOutlet UITextView *txtreason;
@property (weak, nonatomic) IBOutlet UILabel *lblsupporters;
@property(retain,nonatomic)NSMutableArray *arrSupp;
@end
