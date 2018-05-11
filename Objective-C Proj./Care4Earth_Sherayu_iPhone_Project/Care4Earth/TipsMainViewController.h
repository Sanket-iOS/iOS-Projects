//
//  TipsMainViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(retain,nonatomic)NSMutableArray *arrData;
@property (strong, nonatomic) IBOutlet UITableView *tblTips;
- (IBAction)btnback:(id)sender;
- (IBAction)btnlogout:(id)sender;

@end
