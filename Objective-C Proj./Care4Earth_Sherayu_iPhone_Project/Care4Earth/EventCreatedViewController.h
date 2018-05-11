//
//  EventCreatedViewController.h
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCreatedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)btnback:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrData;

@end
