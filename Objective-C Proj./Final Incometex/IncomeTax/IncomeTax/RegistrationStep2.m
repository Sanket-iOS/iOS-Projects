//
//  RegistrationStep2.m
//  IncomeTax
//
//  Created by tops on 3/16/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "RegistrationStep2.h"
#import "DBoperation.h"
@interface RegistrationStep2 ()

@end


@implementation RegistrationStep2
@synthesize txtuserid,txtfname,txtmname,txtlname,txtemail,txtpass,txtconpass,txtsecques,txtsecans,txtpan,txtmobile,txtdob,txtadd;

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
    // Do any additional setup after loading the view.
    
    
    [self.scoll setPagingEnabled:YES];
    [self.scoll setContentSize:CGSizeMake(200, 800)];
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

- (IBAction)btnregsub:(id)sender {
    if ([txtfname.text isEqualToString:@""]||[txtmname.text isEqualToString:@""]||[txtlname.text isEqualToString:@""]||[txtemail.text isEqualToString:@""]||[txtpass.text isEqualToString:@""]||[txtsecques.text isEqualToString:@""]||[txtsecans.text isEqualToString:@""]||[txtpan.text isEqualToString:@""]||[txtmobile.text isEqualToString:@""]||[txtdob.text isEqualToString:@""]||[txtadd.text isEqualToString:@""]) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Enter Proper Data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alrt show];

    }
    else
    {
    DBoperation *data=[[DBoperation alloc] init];
    NSString *strQuery=[[NSString alloc]initWithFormat:@"insert into regi values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",txtfname.text,txtmname.text,txtlname.text,txtemail.text,txtpass.text,txtsecques.text,txtsecans.text,txtpan.text,txtmobile.text,txtdob.text,txtadd.text];
    
    NSLog(@"%@",strQuery);
      BOOL st=[data DMLOpearion:strQuery];
    if (st==true) {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Inserted" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Not Inserted" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
        
    }
    }
    txtfname.text=@"";
    txtmname.text=@"";
    txtlname.text=@"";
    txtemail.text=@"";
    txtpass.text=@"";
    txtsecques.text=@"";
    txtsecans.text=@"";
    txtpan.text=@"";
    txtconpass.text=@"";
    txtmobile.text=@"";
    txtdob.text=@"";
    txtadd.text=@"";
       }



@end
