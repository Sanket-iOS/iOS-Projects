//
//  SendMessageViewController.h
//  Care4Earth
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendMessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tblcontacts;
@property(retain,nonatomic)NSMutableArray *contacts;
@property(retain,nonatomic)NSMutableArray *selectedcontacts;
- (IBAction)btnsend:(id)sender;
@property(retain,nonatomic)NSMutableArray *PhoneList;
- (IBAction)btnback:(id)sender;

@end
