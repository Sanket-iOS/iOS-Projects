//
//  NGOViewController.h
//  Care4Earth
//
//  Created by mac on 2/25/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGOViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tblngo;
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSMutableArray *arrData;
@end
