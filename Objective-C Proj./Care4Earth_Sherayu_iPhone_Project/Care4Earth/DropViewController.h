//
//  DropViewController.h
//  Care4Earth
//
//  Created by mac on 2/25/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface DropViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *tblSimpleTable;
    IBOutlet UIButton *btn;
    IBOutlet UIImageView *i;
    BOOL flag;
   
}
@property(nonatomic,retain)IBOutlet UITableView *tblSimpleTable;
@property(nonatomic,retain)IBOutlet UIButton *btn;
@property(nonatomic,retain)IBOutlet UIImageView *i;
@property(nonatomic,retain)NSMutableArray *arrData;
- (IBAction)btnClicked:(id)sender;



@end
