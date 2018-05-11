//
//  changeViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/26/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ViewController.h"

@interface changeViewController : ViewController
@property(strong,atomic)NSString *str;
@property (strong, nonatomic) IBOutlet UILabel *change_label;
@property (strong, nonatomic) IBOutlet UITextField *change_text1;
@property(strong,atomic)NSNumber *Login_id;
- (IBAction)submit:(id)sender;
- (IBAction)change_text1_editing_begin:(id)sender;
- (IBAction)change_text2_editing_begin:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *change_text2;
@end
