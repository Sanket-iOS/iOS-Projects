//
//  History_Displaydata.m
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "History_Displaydata.h"
#import "HistoryCell.h"
#import "HistoryView.h"
#import "DbOperation.h"
#import "ALCurrency.h"
#import "ViewController.h"


#define getCurrency() [[NSUserDefaults standardUserDefaults] objectForKey:@"currencyType"];

#define getDateFormat() [[NSUserDefaults standardUserDefaults] objectForKey:@"dateFormat"];

#define getIncome() [[NSUserDefaults standardUserDefaults] objectForKey:@"income"]

@interface History_Displaydata ()

@end

int temp;

@implementation History_Displaydata
@synthesize Item,Income_Value,Passemail;

NSString *email;
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
    
    temp = 0;
    Hedding_Label=[[NSArray alloc]initWithObjects:
                   @{@"Label1":@"Category",@"Label2":@"Date",@"Label3":@"Price"},
                   @{@"Label1":@"Date",@"Label2":@"Category",@"Label3":@"Price"},
                   @{@"Label1":@"Month",@"Label2":@"Category",@"Label3":@"Price"},
                   @{@"Label1":@"Category",@"Label2":@"Item",@"Label3":@"Price"},
                   @{@"Label1":@"Mode",@"Label2":@"Date",@"Label3":@"Price"},
                   nil];
    
    
    Income_Value.text = getIncome();
}
-(void)viewWillAppear:(BOOL)animated
{
    DbOperation *DB=[[DbOperation alloc]init];
    SelData=[DB selectTrans];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return SelData.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    HistoryCell *cell=[tableView dequeueReusableCellWithIdentifier:@"hst_cell"];
    
    [cell setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *l1=[[UILabel alloc]initWithFrame:CGRectMake(0, 165, 100,20)];
    
    UILabel *l2=[[UILabel alloc]initWithFrame:CGRectMake(100,165,90,20)];
    UILabel *l3=[[UILabel alloc]initWithFrame:CGRectMake(190,165,135,20)];
    l3.textAlignment = NSTextAlignmentCenter;
    if(Item==0)
    {
        l1.text=[[Hedding_Label objectAtIndex:0]objectForKey:@"Label1"];
        l2.text=[[Hedding_Label objectAtIndex:0]objectForKey:@"Label2"];
        l3.text=[[Hedding_Label objectAtIndex:0]objectForKey:@"Label3"];
        cell.Val1_Label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"CATE"];
        
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        NSString *dateformat = getDateFormat();
        
        [format setDateFormat:dateformat];
        NSString *strdate=[format stringFromDate:[[SelData objectAtIndex:indexPath.row]objectForKey:@"DATE"]];
        
        cell.val2_label.text=strdate;
        NSString *value3Price=[NSString stringWithFormat:@"%@",[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"]];
        
        NSString *currencyType = getCurrency();
        
        if ([currencyType isEqualToString:@"INR"])
        {
            cell.val3_label.text=[NSString stringWithFormat:@"%@", value3Price];
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[value3Price floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    cell.val3_label.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
        cell.val3_label.adjustsFontSizeToFitWidth = YES;
        
        //        cell.val3_label.text=value3Price;
        
        NSNumber *val=[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"];
        int value=[val intValue];
        NSLog(@"%d",value);
        
        temp += value;
        
        NSString *strexp=[[NSString alloc]initWithFormat:@"%d",temp ];
        
        if ([currencyType isEqualToString:@"INR"])
        {
            self.Expense_Value.text=strexp;
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[strexp floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    self.Expense_Value.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        //        DbOperation *db=[[DbOperation alloc]init];
        //     //   ViewController *VC=[self.storyboard instantiateViewControllerWithIdentifier:@"CVC"];
        //        NSString *email=Passemail;
        //        NSString *strQuery=[[NSString alloc]initWithFormat:@"select income from Register where Email='%@'",email];
        //        arrinc=[db selectRegister:strQuery];
        //        int income=[[[arrinc objectAtIndex:indexPath.row]objectForKey:@"INC"] intValue];
        //        Income_Value.text=[[NSString alloc]initWithFormat:@"%d",income];
        
        
    }
    else if(Item==1)
    {
        l1.text=[[Hedding_Label objectAtIndex:1]objectForKey:@"Label1"];
        l2.text=[[Hedding_Label objectAtIndex:1]objectForKey:@"Label2"];
        l3.text=[[Hedding_Label objectAtIndex:1]objectForKey:@"Label3"];
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        NSString *dateformat = getDateFormat();
        
        [format setDateFormat:dateformat];
        NSString *strdate=[format stringFromDate:[[SelData objectAtIndex:indexPath.row]objectForKey:@"DATE"]];
        
        cell.Val1_Label.text=strdate;
        cell.val2_label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"CATE"];
        NSString *value3Price=[NSString stringWithFormat:@"%@",[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"]];
        NSString *currencyType = getCurrency();
        
        if ([currencyType isEqualToString:@"INR"])
        {
            cell.val3_label.text=[NSString stringWithFormat:@"%@", value3Price];
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[value3Price floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    cell.val3_label.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
        cell.val3_label.adjustsFontSizeToFitWidth = YES;
        
        //        cell.val3_label.text=value3Price;
        
        NSNumber *val=[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"];
        int value=[val intValue];
        NSLog(@"%d",value);
        
        temp += value;
        
        NSString *strexp=[[NSString alloc]initWithFormat:@"%d",temp ];
        if ([currencyType isEqualToString:@"INR"])
        {
            self.Expense_Value.text=strexp;
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[strexp floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    self.Expense_Value.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
    }
    else  if(Item==2)
    {
        l1.text=[[Hedding_Label objectAtIndex:2]objectForKey:@"Label1"];
        l2.text=[[Hedding_Label objectAtIndex:2]objectForKey:@"Label2"];
        l3.text=[[Hedding_Label objectAtIndex:2]objectForKey:@"Label3"];
        
        NSDate *currentDate=[[SelData objectAtIndex:indexPath.row]objectForKey:@"DATE"];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate];
        NSInteger monthNumber=[components month];
        
        cell.Val1_Label.text=[self MonthNameString:monthNumber];
        
        cell.val2_label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"CATE"];
        NSString *value3Price=[NSString stringWithFormat:@"%@",[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"]];
        NSString *currencyType = getCurrency();
        
        if ([currencyType isEqualToString:@"INR"])
        {
            cell.val3_label.text=[NSString stringWithFormat:@"%@", value3Price];
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[value3Price floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    cell.val3_label.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
        cell.val3_label.adjustsFontSizeToFitWidth = YES;
        
        //        cell.val3_label.text=value3Price;
        
        NSNumber *val=[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"];
        int value=[val intValue];
        NSLog(@"%d",value);
        
        temp += value;
        
        NSString *strexp=[[NSString alloc]initWithFormat:@"%d",temp ];
        if ([currencyType isEqualToString:@"INR"])
        {
            self.Expense_Value.text=strexp;
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[strexp floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    self.Expense_Value.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
    }
    else if(Item==3)
    {
        l1.text=[[Hedding_Label objectAtIndex:3]objectForKey:@"Label1"];
        l2.text=[[Hedding_Label objectAtIndex:3]objectForKey:@"Label2"];
        l3.text=[[Hedding_Label objectAtIndex:3]objectForKey:@"Label3"];
        cell.Val1_Label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"CATE"];
        cell.val2_label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"ITEM"];
        NSString *value3Price=[NSString stringWithFormat:@"%@",[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"]];
        NSString *currencyType = getCurrency();
        
        if ([currencyType isEqualToString:@"INR"])
        {
            cell.val3_label.text=[NSString stringWithFormat:@"%@", value3Price];
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[value3Price floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    cell.val3_label.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
        cell.val3_label.adjustsFontSizeToFitWidth = YES;
        
        //        cell.val3_label.text=value3Price;
        
        NSNumber *val=[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"];
        int value=[val intValue];
        NSLog(@"%d",value);
        
        temp += value;
        
        NSString *strexp=[[NSString alloc]initWithFormat:@"%d",temp ];
        if ([currencyType isEqualToString:@"INR"])
        {
            self.Expense_Value.text=strexp;
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[strexp floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    self.Expense_Value.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
    }
    else if (Item==4)
    {
        l1.text=[[Hedding_Label objectAtIndex:4]objectForKey:@"Label1"];
        l2.text=[[Hedding_Label objectAtIndex:4]objectForKey:@"Label2"];
        l3.text=[[Hedding_Label objectAtIndex:4]objectForKey:@"Label3"];
        cell.Val1_Label.text=[[SelData objectAtIndex:indexPath.row]objectForKey:@"MODE"];
        
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        NSString *dateformat = getDateFormat();
        
        [format setDateFormat:dateformat];
        NSString *strdate=[format stringFromDate:[[SelData objectAtIndex:indexPath.row]objectForKey:@"DATE"]];
        cell.val2_label.text=strdate;
        NSString *value3Price=[NSString stringWithFormat:@"%@",[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"]];
        NSString *currencyType = getCurrency();
        
        if ([currencyType isEqualToString:@"INR"])
        {
            cell.val3_label.text=[NSString stringWithFormat:@"%@", value3Price];
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[value3Price floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    cell.val3_label.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
        cell.val3_label.adjustsFontSizeToFitWidth = YES;
        
        //        cell.val3_label.text=value3Price;
        
        NSNumber *val=[[SelData objectAtIndex:indexPath.row]objectForKey:@"PRICE"];
        int value=[val intValue];
        NSLog(@"%d",value);
        
        temp += value;
        
        NSString *strexp=[[NSString alloc]initWithFormat:@"%d",temp ];
        if ([currencyType isEqualToString:@"INR"])
        {
            self.Expense_Value.text=strexp;
            
        }
        else
        {
            [ALCurrency convertFromCurrency:@"INR" toCurrency:currencyType value:[strexp floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
                if (success) {
                    // Set the converted value in the label
                    self.Expense_Value.text=[NSString stringWithFormat:@"%.2f", convertedValue];
                    
                    
                }
            } failureBlock:^(NSError *error) {
            }];
        }
        
    }
    l1.backgroundColor=[UIColor grayColor];
    l2.backgroundColor=[UIColor grayColor];
    l3.backgroundColor=[UIColor grayColor];
    
    l1.textColor=[UIColor whiteColor];
    l2.textColor=[UIColor whiteColor];
    l3.textColor=[UIColor whiteColor];
    
    [self.view   addSubview:l1];
    [self.view addSubview:l2];
    [self.view addSubview:l3];
    
    
    return cell;
}

- (void) performExpand{
    UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"nfdj" message:@"Delete Record" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [al show];
}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        int userid=[[[SelData objectAtIndex:indexPath.row] objectForKey:@"TID"] intValue];
        NSString *deleteQuery=[NSString stringWithFormat:@"delete from Trans where t_id=%d",userid];
        DbOperation *db=[[DbOperation alloc]init];
        [db DMLOperation:deleteQuery];
        [SelData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
    
    
}



-(NSString*)MonthNameString:(NSInteger)monthNumber
{
    NSDateFormatter *formate = [NSDateFormatter new];
    
    NSArray *monthNames = [formate standaloneMonthSymbols];
    
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
    
    return monthName;
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

@end
