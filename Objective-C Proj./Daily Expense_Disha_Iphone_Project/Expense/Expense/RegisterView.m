//
//  RegisterView.m
//  Expense
//
//  Created by mac on 4/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "RegisterView.h"
#import "DbOperation.h"
#import "Validation.h"
#import "ViewController.h"
@interface RegisterView ()

@end

@implementation RegisterView
@synthesize NameBox,PassBox,EmailBox,rePassBox,IncomeBox,ContactBox;



NSString *str;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//-(void)RequireValid
//{
//
//    if([NameBox.text isEqualToString:@""])
//    {blankerror1.hidden=NO;
//        str=@"No Val";}
//    else
//    {
//        str=@"YES";
//        blankerror1.hidden=YES;}
//    if([PassBox.text isEqualToString:@""])
//    {blankerror2.hidden=NO;
//        str=@"No Val";}
//    else
//    {str=@"YES";
//        blankerror2.hidden=YES;}
//    if([rePassBox.text isEqualToString:@""])
//    {blankerror3.hidden=NO;
//        str=@"No Val";}
//    else
//    {str=@"YES";
//        blankerror3.hidden=YES;}
//    if([rePassBox.text isEqualToString:@""])
//    {blankerror4.hidden=NO;
//        str=@"No Val";}
//    else
//    { str=@"YES";
//        blankerror4.hidden=YES;}
//    if([EmailBox.text isEqualToString:@""])
//    {blankerror5.hidden=NO;
//        str=@"No Val";}
//    else
//    { str=@"YES";
//        blankerror5.hidden=YES;}
//    if([ContactBox.text isEqualToString:@""])
//    {blankerror6.hidden=NO;
//        str=@"No Val";}
//    else
//    {str=@"YES";
//        blankerror6.hidden=YES;}
//    if([IncomeBox.text isEqualToString:@""])
//    {blankerror7.hidden=NO;
//        str=@"No Val";}
//    else
//    {str=@"YES";
//        blankerror7.hidden=YES;}
//
//
//
//}
- (IBAction)Register:(id)sender {
    //  [self RequireValid];
    Validation *vl=[[Validation alloc]init];
    NSString *e=EmailBox.text;
    NSString *p=PassBox.text;
    NSString *rp=rePassBox.text;
    NSString *pr=ContactBox.text;
    [vl ValidNumber:pr];
    BOOL em=[vl validEmail:e];
    BOOL ps=[vl strongPassword:p];
    BOOL rps=[vl strongPassword:rp];
    
    //   if([str isEqualToString:@"YES"])
    //  {
    if([vl.Validationmsg isEqualToString:@"YES Matche"])
        
    {
        if(em&&ps&&rps)
        {
            if(p != rp)
            {
                NSString *insertQuery=[NSString stringWithFormat:@"insert into Register(Name,Pass,Email,Contact,Income) Values('%@','%@','%@',%d,%d)",NameBox.text,PassBox.text,EmailBox.text,[ContactBox.text intValue],[IncomeBox.text intValue]];
                
                DbOperation *Db=[[DbOperation alloc]init];
                BOOL result=[Db DMLOperation:insertQuery];
                NSString *msg;
                if(result)
                {
                    msg=@"Registraction Succesfull";
                }
                else
                {
                    msg=@"Do not Register!!";
                }
                UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Message" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
                [al show];
                ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CVC"];
                [self.navigationController pushViewController:vc animated:YES];
            }
            
            else
            {
                UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"Email,Password and re-Password Fomate is invalid" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alt show];
            }
        }
    }
    else
    {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"Password not Matched" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alt show];
    }
    
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == IncomeBox)
    {
        NSRange rang = [string rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"1234567890"]];
        if (rang.length == 0) {
            
            const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
            int isBackSpace = strcmp(_char, "\b");
            
            if (isBackSpace == -8) {
                // is backspace
                return YES;
            }
            
            return NO;
        }
    }
    
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.text.length >0)
    {
        return YES;
    }
    return NO;
}

- (IBAction)Clear:(id)sender {
    NameBox.text=nil;
    PassBox.text=nil;
    EmailBox.text=nil;
    rePassBox.text=nil;
    IncomeBox.text=nil;
    ContactBox.text=nil;
}
@end
