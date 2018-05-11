//
//  ReminderCell.h
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderCell : UITableViewCell
@property(strong,nonatomic)NSString *str;
@property(strong,nonatomic)NSString *str1;
@property(strong,nonatomic)NSString *str2;

@property (strong, nonatomic) IBOutlet UILabel *addl;
@property (strong, nonatomic) IBOutlet UILabel *datel;
@property (strong, nonatomic) IBOutlet UILabel *timel;


@end
