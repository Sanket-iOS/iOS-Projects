//
//  InnerArticleViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InnerArticleViewController : UIViewController
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSString *petid;
@property (weak, nonatomic) IBOutlet UITextView *txtview;
@property(retain,nonatomic)NSMutableArray *ardata;
@end
