//
//  PetCatSelectedViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PetCatSelectedViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *arrData;
- (IBAction)btnBack:(id)sender;
@property(retain,nonatomic)NSString *catid;
@end