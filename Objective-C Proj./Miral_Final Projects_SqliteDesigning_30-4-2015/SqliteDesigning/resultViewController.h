//
//  resultViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *enno;
@property (strong,nonatomic)NSNumber *Login_id;
@property(strong,nonatomic)NSMutableString *SBid;

@property (strong,nonatomic)NSMutableArray *marks_arr;
@property (strong,nonatomic)NSArray *sub_arr;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
