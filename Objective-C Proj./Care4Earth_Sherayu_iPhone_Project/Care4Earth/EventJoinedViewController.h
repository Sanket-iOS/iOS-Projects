//
//  EventJoinedViewController.h
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventJoinedViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(retain,nonatomic)NSMutableArray *arrData;
- (IBAction)btnback:(id)sender;

@end
