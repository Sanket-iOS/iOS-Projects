//
//  EditTrans.m
//  Expense
//
//  Created by tops on 3/14/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "EditTrans.h"
#import "DbOperation.h"
#import "Validation.h"
@interface EditTrans ()

@end

@implementation EditTrans

@synthesize DateTextBox,CategoryBox,ModeTextBox,ItemBox,DescTextView,PriceBox,Trans_idBox,blankerror1,blankerror2,blankerror3,blankerror4,blankerror5,blankerror6,blankerror7;


NSString *str;
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
    Category=[[NSArray alloc]initWithObjects:@"Personal",@"Clothing",@"Automobile",@"Bank Charges",@"Food",@"HouseHold",@"Insurences",@"Health",@"Education",@"Events",@"Gifts",@"Job Expenses",@"Leisure(daily/non-vaction",@"Loans",@"Savings",@"Taxes",@"Ulities",@"Vaction",@"hobbies", nil];
    Pay_mod=[[NSArray alloc]initWithObjects:@"Credit_Card",@"Cash",@"Cheque",@"OnAccount", nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SelectCategory:(id)sender
{
    if (CategoryTable==NULL) {
        
        CategoryTable=[[UITableView alloc]initWithFrame:CGRectMake(100, 50, 200, 600)
                                                  style:UITableViewStylePlain];
        CategoryTable.delegate=self;
        CategoryTable.dataSource=self;
        [self.view addSubview:CategoryTable];
        
    }
    
    
    
}


- (IBAction)SelectPaymentMode:(id)sender {
    if (Pay_ModeTable==NULL) {
        
        Pay_ModeTable=[[UITableView alloc]initWithFrame:CGRectMake(150, 240, 130, 200)
                                                  style:UITableViewStylePlain];
        Pay_ModeTable.delegate=self;
        Pay_ModeTable.dataSource=self;
        [self.view addSubview:Pay_ModeTable];
        
    }
}

-(void)RequireValid
{
    if([Trans_idBox.text isEqualToString:@""])
    {blankerror1.hidden=NO;}
    else
    {
        str=@"YES";
        blankerror1.hidden=YES;}
    if([DateTextBox.text isEqualToString:@""])
    {blankerror2.hidden=NO;
        str=@"No Val";}
    else
    {
        str=@"YES";
        blankerror2.hidden=YES;}
    if([CategoryBox.text isEqualToString:@""])
    {blankerror3.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankerror3.hidden=YES;}
    if([ModeTextBox.text isEqualToString:@""])
    {blankerror4.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankerror4.hidden=YES;}
    if([ItemBox.text isEqualToString:@""])
    {blankerror5.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
        blankerror5.hidden=YES;}
    if([DescTextView.text isEqualToString:@""])
    {blankerror6.hidden=NO;
        str=@"No Val";}
    else
    { str=@"YES";
        blankerror6.hidden=YES;}
    if([PriceBox.text isEqualToString:@""])
    {blankerror7.hidden=NO;
        str=@"No Val";}
    else
    {str=@"YES";
        blankerror7.hidden=YES;}
    
    
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
- (IBAction)SelectDate:(id)sender {
    MyDatePicker=[[UIDatePicker alloc]init];
    [MyDatePicker setFrame:CGRectMake(0, 200, 320, 400)];
    [MyDatePicker addTarget:self action:@selector(select:) forControlEvents:UIControlEventValueChanged];
    MyDatePicker.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:MyDatePicker];
}

-(void)select:(id)sender
{
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateStyle:NSDateFormatterMediumStyle];
    DateTextBox.text=[format stringFromDate:MyDatePicker.date];
    MyDatePicker.hidden=YES;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView ==CategoryTable)
        
        return Category.count;
    
    else if(tableView==Pay_ModeTable)
        
        return  Pay_mod.count;
    else
        return 1;
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell *cell=[CategoryTable dequeueReusableCellWithIdentifier:@"cell1"];
    if(tableView ==CategoryTable)
    {
        
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Category objectAtIndex:indexPath.row];
        }
        
    }
    else if(tableView==Pay_ModeTable)
    {
        
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=[Pay_mod objectAtIndex:indexPath.row];
        }
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView ==CategoryTable)
    {
        CategoryBox.text=[Category objectAtIndex:indexPath.row];
        [CategoryTable removeFromSuperview];
        CategoryTable=nil;
    }
    else if(tableView==Pay_ModeTable)
    {
        ModeTextBox.text=[Pay_mod objectAtIndex:indexPath.row];
        [Pay_ModeTable removeFromSuperview];
        Pay_ModeTable=nil;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (IBAction)ChengeTrans_id:(id)sender
    {
 //   NSString *Item=[NSString stringwit]
                  
                  
                  
                  
                  
  //                Item,OPrice,category,description,
  //  ModeTextBox
    
   }
- (IBAction)EditClciked:(id)sender {
    [self RequireValid];
    Validation *val=[[Validation alloc]init];
    NSString *pr=PriceBox.text;
    NSString *tid=Trans_idBox.text;
    [val ValidNumber:pr];
    [val ValidNumber:tid];
   if([str isEqualToString:@"YES"])
   {
       if([val.Validationmsg isEqualToString:@"YES Matche"])
       {
    DbOperation *db=[[DbOperation alloc]init];
    arrData= (NSMutableArray*) [db selectTrans];
    
    //NSInteger tid=Trans_idBox.text;
    NSString *UpdateQuery=[[NSString alloc]initWithFormat:@"update Trans set item='%@',Price='%@',Category='%@',TDate='%@',Desc='%@',Mode='%@' where t_id='%@'",ItemBox.text,PriceBox.text,CategoryBox.text,DateTextBox.text,DescTextView.text,ModeTextBox.text,Trans_idBox.text];
    
    BOOL res=[db DMLOperation:UpdateQuery];
    NSString *msg;
    if(res)
    {
        msg=@"Transation Updated!!";
        
    }
    else
    {
        msg=@"Transation not update";
    }
    UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Update message" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alt show];
       }
   }
    Trans_idBox.text=nil;
    ItemBox.text=nil;
    PriceBox.text=nil;
    CategoryBox.text=nil;
    DateTextBox.text=nil;
    DescTextView.text=nil;
    ModeTextBox.text=nil;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
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
    
    return YES;
}
- (IBAction)BackToADD:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
