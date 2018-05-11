//
//  shownoticeViewController.h
//  SqliteDesigning
//
//  Created by mac on 3/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shownoticeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *notice_textview;
@property (weak, nonatomic) IBOutlet UILabel *notice_title;
@property(strong,nonatomic)NSMutableString *title_name,*note;

@end
