//
//  profileViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "profileViewController.h"
#import "DBmanger.h"
#import "changeViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController
@synthesize name,sem,branch,mblno,pwd,emailid,enno,Login_id;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];    
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    enno.text=[dbm.en_arr objectAtIndex:[Login_id intValue]];
    name.text=[dbm.name_arr objectAtIndex:[Login_id intValue]];
    sem.text=[dbm.sem_arr objectAtIndex:[Login_id intValue]];
    branch.text=[dbm.branch_arr objectAtIndex:[Login_id intValue]];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    mblno.text=[dbm.mobile_arr objectAtIndex:[Login_id intValue]];
    emailid.text=[dbm.email_arr objectAtIndex:[Login_id intValue]];
    pwd.text=[dbm.pwd_arr objectAtIndex:[Login_id intValue]];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)chngepwd:(id)sender
{
   
    changeViewController *cvc=[self.storyboard instantiateViewControllerWithIdentifier:@"change"];
    cvc.str=@"password";
    cvc.Login_id=Login_id;
    [self.navigationController pushViewController:cvc animated:YES];
    
}
- (IBAction)changeMbl:(id)sender
{
    
    changeViewController *cvc=[self.storyboard instantiateViewControllerWithIdentifier:@"change"];
    cvc.str=@"mobile";
    cvc.Login_id=Login_id;
    [self.navigationController pushViewController:cvc animated:YES];

}
- (IBAction)changeEmail:(id)sender
{
    changeViewController *cvc=[self.storyboard instantiateViewControllerWithIdentifier:@"change"];
    cvc.str=@"Emailid";
    cvc.Login_id=Login_id;
    [self.navigationController pushViewController:cvc animated:YES];
}
@end
