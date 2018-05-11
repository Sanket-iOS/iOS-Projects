//
//  DayViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(retain,nonatomic)NSNumber *Login_id;
@end
