//
//  RegisterationViewController.h
//  Care4Earth
//
//  Created by tops on 2/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   
        IBOutlet UITableView *tblSimpleTable;
        IBOutlet UIButton *btn;
        IBOutlet UIImageView *i;
     BOOL flag;
    
    IBOutlet UITableView *tblCity;
    IBOutlet UIButton *btn1;
    
    BOOL flag1;
}
- (IBAction)btnRegister:(id)sender;
- (IBAction)btnselect:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrData;
@property(nonatomic,retain)NSMutableArray *arrData1;
@property (weak, nonatomic) IBOutlet UITableView *tblstate;
@property(nonatomic,retain)IBOutlet UIButton *btn;
@property(nonatomic,retain)IBOutlet UIImageView *i;
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture;
- (IBAction)btnCity:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblCity;
@property(nonatomic,retain)IBOutlet UIButton *btn1;
- (void)handleTapGesture1:(UITapGestureRecognizer *)tapGesture1;
@property (weak, nonatomic) IBOutlet UITextField *txtfullname;
@property (weak, nonatomic) IBOutlet UITextField *txtadd;
@property (weak, nonatomic) IBOutlet UITextField *txtcont;
@property (weak, nonatomic) IBOutlet UITextField *txtemailid;
@property (weak, nonatomic) IBOutlet UITextField *txtpass;
@property (weak, nonatomic) IBOutlet UITextField *txtcnfrpass;
@end
