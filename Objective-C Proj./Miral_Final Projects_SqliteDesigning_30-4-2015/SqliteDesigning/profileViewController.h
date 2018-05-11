//
//  profileViewController.h
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *enno;
@property (strong, nonatomic) IBOutlet UILabel *sem;
@property (strong, nonatomic) IBOutlet UILabel *branch;
@property (strong, nonatomic) IBOutlet UILabel *pwd;
@property (strong, nonatomic) IBOutlet UILabel *mblno;
@property (strong, nonatomic) IBOutlet UILabel *emailid;
- (IBAction)chngepwd:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *chngeMblNo;
@property (strong, nonatomic) IBOutlet UIButton *chngeid;

- (IBAction)changeEmail:(id)sender;
@property(retain,nonatomic)NSNumber *Login_id;
- (IBAction)changeMbl:(id)sender;

@end
