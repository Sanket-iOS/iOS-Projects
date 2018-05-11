//
//  noticeViewController.h
//  SqliteDesigning
//
//  Created by mac on 3/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface noticeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSNumber *Login_id;
@property(nonatomic,strong)NSMutableString *SBid;
@property(atomic,strong)NSString *check;

@property (strong, nonatomic) IBOutlet UILabel *lbl_notice_placement;
@property(nonatomic,strong)NSMutableArray *notice_arr,*notice_arr1,*date_arr;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
