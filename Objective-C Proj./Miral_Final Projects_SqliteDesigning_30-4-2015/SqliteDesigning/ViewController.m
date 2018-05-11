//
//  ViewController.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ViewController.h"
#import "DBmanger.h"
#import "optionViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userid,password,invalid,login_image,login_button;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor clearColor];
    self.login_image.layer.cornerRadius = self.login_image.frame.size.width / 2;
    self.login_image.clipsToBounds = YES;
    login_image.image=[UIImage imageNamed:@"students.jpg"];
    
    login_button.layer.cornerRadius = 10; // this value vary as per your desire
    login_button.clipsToBounds = YES;
    
    
    
    
    self.navigationItem.title=@"engineering college,gandhinagar";
   
}

-(void)viewWillAppear:(BOOL)animated
{
    userid.text=@"User ID....";
    password.secureTextEntry=NO;
    password.text=@"Password...";
    
    
    
}
- (IBAction)login:(id)sender
{
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    for(int i=0;i<[dbm.en_arr count];i++)
    {
        
        if([[dbm.en_arr objectAtIndex:i] isEqualToString:userid.text] && [[dbm.pwd_arr objectAtIndex:i] isEqualToString:password.text])
        {
           
            
            optionViewController *ovc=[self.storyboard instantiateViewControllerWithIdentifier:@"option"];
            ovc.name_arr=dbm.name_arr;
             ovc.Login_id=[[NSNumber alloc]initWithInt:i];
            
            
            
            [self.navigationController pushViewController:ovc animated:YES];
           
            
            break;
            
        }
        
        if(i==[dbm.en_arr count]-1)
        
        {
            invalid.hidden=NO;
            
        }
        
    
    }
   
    userid.text=@"User ID....";
    password.secureTextEntry=NO;
    password.text=@"Password...";
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)editing_did_begin_UID:(id)sender
{
    userid.text=nil;
    invalid.hidden=YES;
    
}
- (IBAction)editing_did_begin_pwd:(id)sender
{
    password.text=nil;
    password.secureTextEntry=YES;
    invalid.hidden=YES;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




@end
