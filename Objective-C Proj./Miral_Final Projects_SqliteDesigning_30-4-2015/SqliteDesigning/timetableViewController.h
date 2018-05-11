//
//  timetableViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timetableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *branch;
@property (strong, nonatomic) IBOutlet UILabel *sem;
@property (strong, nonatomic) IBOutlet UILabel *day;

@property(strong,nonatomic)NSString *day_name;
@property(strong,nonatomic )NSNumber *Login_id;
@property(strong,nonatomic)NSString *select_day;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
