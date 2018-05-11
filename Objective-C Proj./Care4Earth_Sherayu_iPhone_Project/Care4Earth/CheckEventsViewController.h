//
//  CheckEventsViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckEventsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)btnback:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrData;
@end
