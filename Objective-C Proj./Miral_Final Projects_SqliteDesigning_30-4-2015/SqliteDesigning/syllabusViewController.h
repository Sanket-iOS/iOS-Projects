//
//  syllabusViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface syllabusViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *branch;
@property (strong, nonatomic) IBOutlet UILabel *sem;
@property (strong,nonatomic)NSNumber *Login_id;
@property (strong,nonatomic)NSMutableArray *sub_arr,*syllabus_arr;
@property(strong,nonatomic)NSMutableString *SBid;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
