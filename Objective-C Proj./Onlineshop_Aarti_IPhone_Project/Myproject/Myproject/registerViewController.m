//
//  registerViewController.m
//  Myproject
//
//  Created by tops on 12/24/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import "registerViewController.h"
#import "DBHandler.h"

@interface registerViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation registerViewController
@synthesize scroll,lblcity,lblcountry,txtfirstname,txtlastname,txtaddress,txtemailid,txtmobileno,txtpassword,txtpincode,txtrepassword;
- (void)viewDidLoad
{
   

    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    countryarr=[[NSArray alloc]initWithObjects:@"india",@"us",@"uk",@"England", nil];
    cityarr=[[NSArray alloc]initWithObjects:@"Visnagar",@"Ahmedabad",@"Surat", nil];
    self.scroll.contentSize=CGSizeMake(320, 1100);
   [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==50)
    {
        return countryarr.count;
    }
    else if(tableView.tag==51)
    {
        return cityarr.count ;
    }
    return 0;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
  
       
        if (tableView.tag==50) {
                       [ cell.textLabel setHighlighted:YES];
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text=[countryarr objectAtIndex:indexPath.row];
            tableView.layer.masksToBounds=YES;
            tableView.layer.borderWidth=2;
            tableView.layer.borderColor = [UIColor blackColor].CGColor;
            //txtcounry=cell.textLabel.text;
        }
         if (tableView.tag==51)
        {
           
            [ cell.textLabel setHighlighted:YES];
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.textLabel.text=[cityarr objectAtIndex:indexPath.row];
            tableView.layer.masksToBounds=YES;
            tableView.layer.borderWidth=2;
            tableView.layer.borderColor = [UIColor blackColor].CGColor;
         //txtcity=cell.textLabel.text;
        }
        
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    lblcountry.text=[countryarr objectAtIndex:indexPath.row];
    lblcity.text=[cityarr objectAtIndex:indexPath.row];
    [tableView removeFromSuperview];
    tableView=nil;
}



- (IBAction)btncity:(id)sender {
    UITableView *dynamictable1;
    if (dynamictable1==nil) {
        dynamictable1=[[UITableView alloc]initWithFrame:CGRectMake(130, 354, 150, 300) style:UITableViewStylePlain];
        dynamictable1.delegate=self;
        dynamictable1.dataSource=self;
        dynamictable1.tag=51;
        [self.view  addSubview:dynamictable1];
        
    }
}




/*- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}*/
NSInteger countErr1=0;


- (IBAction)btnregister:(id)sender
{
    /* NSDictionary *userdata=@{@"First_Name":txtfirstname.text, @"Last_Name":txtlastname.text,@"Address":txtaddress.text,@"City":lblcity.text,@"State":lblcountry.text,@"Pincode":txtpincode.text,@"Mobileno":txtmobileno.text,@"EmailID":txtemailid.text,@"Password":txtpassword.text,@"Conform_Password":txtrepassword.text};
     
     NSURL *url=[[NSURL alloc]initWithString:@"http://shopapi.somee.com/api/values/PostNewUser/"];
     NSData *postData=[NSJSONSerialization dataWithJSONObject:userdata options:0 error:nil];
     NSMutableURLRequest *requst=[NSMutableURLRequest requestWithURL:url];
     [requst setHTTPMethod:@"POST"];
     [requst setHTTPBody:postData];
     [requst setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     [requst setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
     NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:requst delegate:self];*/
    
    NSString *mobileNumberPattern = @"[789][0-9]{9}";
    NSPredicate *mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    
    BOOL matched = [mobileNumberPred evaluateWithObject:txtmobileno.text];
    NSString *emailRegEx =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regExpred =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    BOOL myStringCheck = [regExpred evaluateWithObject:txtemailid.text];
    /*NSString *query=[NSString stringWithFormat:@"insert into Login_Master(First_Name,Last_Name,Address,City,Country,Pincode,Mobileno,EmailID,Password,Conform_Password) values('%@','%@','%@','%@','%@','%i','%i','%@','%@','%@')",self.txtfirstname.text,self.txtlastname.text,self.txtaddress.text,self.lblcity.text,self.lblcountry.text,[self.txtpincode.text intValue],[self.txtmobileno.text intValue],self.txtemailid.text,self.txtpassword.text,self.txtrepassword.text];
    DBHandler *db=[[DBHandler alloc]init];
    NSLog(@"%@",query);
    BOOL result=[db DMLOperations:query];
    if(result)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Operation Successfully completed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }*/
    if([[txtfirstname text] isEqualToString:@""] || [[txtlastname text] isEqualToString:@""]||[[txtaddress text] isEqualToString:@""]||[[txtmobileno text] isEqualToString:@""]||[[txtpincode text] isEqualToString:@""]||[[txtemailid text] isEqualToString:@""]||[[txtpassword text] isEqualToString:@""]||[[txtrepassword text] isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"message" message:@"One of them is Empty so Registration in Failed!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        countErr1=1;
    }
    
    else if (txtfirstname.text.length==NULL)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter First Name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if(txtlastname.text.length==NULL)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter Last Name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (txtaddress.text.length==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter Address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (!matched)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"enter valid number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (txtpincode.text.length > 6)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter 6 digit number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (!myStringCheck)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
  
    else if (txtpassword.text.length<8)
        
    {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter 8 character password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;

    }
    else if (txtrepassword.text.length<8)
        
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter 8 charcter password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (![txtrepassword.text isEqualToString:txtpassword.text])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Test!" message:@"Password Not Matched!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
           else
    {
        NSDictionary *userdata=@{@"First_Name":txtfirstname.text, @"Last_Name":txtlastname.text,@"Address":txtaddress.text,@"City":lblcity.text,@"State":lblcountry.text,@"Pincode":txtpincode.text,@"Mobileno":txtmobileno.text,@"EmailID":txtemailid.text,@"Password":txtpassword.text,@"Conform_Password":txtrepassword.text};
        
        NSURL *url=[[NSURL alloc]initWithString:@"http://shopapi.somee.com/api/values/PostNewUser/"];
        NSData *postData=[NSJSONSerialization dataWithJSONObject:userdata options:0 error:nil];
        NSMutableURLRequest *requst=[NSMutableURLRequest requestWithURL:url];
        [requst setHTTPMethod:@"POST"];
        [requst setHTTPBody:postData];
        [requst setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [requst setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:requst delegate:self];
        
        UIViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"cell"];
        [self.navigationController pushViewController:category1 animated:YES];

    }
    }
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"%@",response);
}
   - (IBAction)repassword:(id)sender {
}

- (IBAction)password:(id)sender {
}

- (IBAction)emailid:(id)sender {
}

- (IBAction)pincode:(id)sender {
}

- (IBAction)mobileno:(id)sender {
}

- (IBAction)address:(id)sender {
}

- (IBAction)lastname:(id)sender {
}

- (IBAction)firstname:(id)sender {
}
- (IBAction)btncountry:(id)sender
{
    UITableView *dynamictable;
    if(dynamictable==nil)
    {
        dynamictable=[[UITableView alloc]initWithFrame:CGRectMake(135, 67, 140, 300) style:UITableViewStylePlain];
        
        dynamictable.delegate=self;
        dynamictable.dataSource=self;
        dynamictable.tag=50;
        [self.view addSubview:dynamictable];
    }
}
@end
