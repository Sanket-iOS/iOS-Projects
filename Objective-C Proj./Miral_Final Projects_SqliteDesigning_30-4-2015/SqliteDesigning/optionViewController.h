//
//  optionViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ViewController.h"

@interface optionViewController : ViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *name_label;
@property (retain,nonatomic)NSMutableArray *name_arr;
@property (retain,nonatomic)NSNumber *Login_id;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *hi_image;

@end
