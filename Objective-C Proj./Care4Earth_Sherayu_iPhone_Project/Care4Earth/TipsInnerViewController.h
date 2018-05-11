//
//  TipsInnerViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsInnerViewController : UIViewController
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSString *tipsid;
@property (weak, nonatomic) IBOutlet UITextView *txtview;
@property(retain,nonatomic)NSMutableArray *ardata;
@property(retain,nonatomic)NSMutableArray *urldata;
- (IBAction)btnlogout:(id)sender;

@end
