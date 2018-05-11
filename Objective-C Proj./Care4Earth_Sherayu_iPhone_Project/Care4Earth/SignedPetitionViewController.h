//
//  SignedPetitionViewController.h
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignedPetitionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *arrData;
- (IBAction)btnBack:(id)sender;

@end
