//
//  SelectArticleViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectArticleViewController : UIViewController
- (IBAction)btnBack:(id)sender;
@property(retain,nonatomic)NSString *tipsid;
@property(retain,nonatomic)NSMutableArray *ardata;

@end
