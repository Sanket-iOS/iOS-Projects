//
//  StartPetitionViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartPetitionViewController : UIViewController<UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
    IBOutlet UITableView *tblSimpleTable;
    IBOutlet UIButton *btn;
    IBOutlet UIImageView *i;
    BOOL flag;
}
- (IBAction)btnBack:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tbldata;
- (IBAction)btnSelect:(id)sender;
- (IBAction)btnStart:(id)sender;
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture;
@property (weak, nonatomic) IBOutlet UITextField *txttitle;
@property (weak, nonatomic) IBOutlet UITextField *txtagainst;
@property (weak, nonatomic) IBOutlet UITextView *txtview;
@property(retain,nonatomic)NSMutableArray *arrData;

@end
