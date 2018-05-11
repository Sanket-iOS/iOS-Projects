//
//  forgotpassViewController.m
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "forgotpassViewController.h"
#import "DBoperation.h"

@interface forgotpassViewController ()

@end

@implementation forgotpassViewController
@synthesize txtemail,txtnewpass,txtpan;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnsave:(id)sender {
    DBoperation *data=[[DBoperation alloc]init];
    NSString *Str=[[NSString alloc]initWithFormat:@"update regi set pass='%@' where email='%@' and panno='%@'" ,txtnewpass.text,txtemail.text,txtpan.text];
    
    
    NSLog(@"%@",Str);
    
   BOOL st= [data DMLOpearion:Str];
    if (st==true) {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"save Succesfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alrt show];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Not Updated" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];
        
        
    }
}
@end
