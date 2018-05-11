//
//  CreateEventViewController.h
//  Care4Earth
//
//  Created by tops on 2/12/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateEventViewController : UIViewController<UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tblSimpleTable;
    IBOutlet UIButton *btn;
    IBOutlet UIImageView *i;
    BOOL flag;
    
    IBOutlet UITableView *tblCity;
    IBOutlet UIButton *btn1;
    
    BOOL flag1;
}
- (IBAction)btnbcak:(id)sender;
- (IBAction)btnCreate:(id)sender;
- (IBAction)btnState:(id)sender;
- (IBAction)btnCity:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblcity;
@property (strong, nonatomic) IBOutlet UITableView *tblstate;
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture;
- (void)handleTapGesture1:(UITapGestureRecognizer *)tapGesture1;
@property(retain,nonatomic)NSMutableArray *arrData;
@property(retain,nonatomic)NSMutableArray *arrData1;
@end
