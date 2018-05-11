//
//  ordViewController.m
//  Myproject
//
//  Created by mac on 3/17/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "ordViewController.h"
#import "complainViewController.h"
#import "collectionViewController.h"
#import "tttttttViewController.h"
#import "loginViewController.h"

@interface ordViewController ()

@end

@implementation ordViewController
@synthesize txtaddress,txtamount,txtcity,txtdate,txtname,txtprice,txtquantity,txtshipingrate,txtstate;
- (void)viewDidLoad {
    NSString *number = [[NSString alloc] initWithFormat:@"%d", 150];

   txtname.text=self.st1;
    txtprice.text=self.st2;
    txtshipingrate.text=number;
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

- (IBAction)makeorder:(id)sender {
    if([[txtquantity text] isEqualToString:@""] || [[txtaddress text] isEqualToString:@""]||[[txtdate text] isEqualToString:@""]||[[txtcity text] isEqualToString:@""]||[[txtstate text] isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"message" message:@"One of them is Empty so order in Failed!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        //countErr1=1;
    }
    else
    {
        //txtname.text=self.strpn1;
        //txtprice.text=self.strpn5;
       // NSDictionary *userdata=@{@"Quantity":txtquantity,@"Name":txtname,@"Price":txtprice,@"Address":txtaddress.text,@"Date":txtdate,@"City":txtcity.text,@"State":txtstate.text,@"Shipping_Rate":txtshipingrate,@"Amount":txtamount};
        
        /*NSURL *url=[[NSURL alloc]init];
        
        url=[[NSURL alloc]initWithString:@"http://shopapi.somee.com/api/values/postOrderDetails?Quantity=%@&Name=%@&price=%@&Address=%@&Date=%@&City=%@&State=%@&Shipping_Rate=%@&Amount=%@",txtquantity.text,txtname.text,txtprice.text,txtaddress.text,txtcity.text,txtstate.text,txtshipingrate.text,txtamount.text];
    NSData *postData=[NSJSONSerialization dataWithJSONObject:userdata options:0 error:nil];
    NSMutableURLRequest *requst=[NSMutableURLRequest requestWithURL:url];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:postData];
    [requst setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requst setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:requst delegate:self];*/
        NSString *Str=[[NSString alloc]initWithFormat:@"http://shopapi.somee.com/api/values/postOrderDetails?Quantity=%@&Name=%@&Price=%@&Address=%@&Date=%@&City=%@&State=%@&Shipping_Rate=%@&Amount=%@",txtquantity.text,txtname.text,txtprice.text,txtaddress.text,txtdate.text,txtcity.text,txtstate.text,txtshipingrate.text,txtamount.text];
        
        
        
        
        NSURL *Url=[[NSURL alloc]initWithString:Str];
        NSLog(@"%@",Url);
        NSURLRequest *req=[[NSURLRequest alloc]initWithURL:Url];
        NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
        int val1 = [self.st2 integerValue];
        int val2 = [txtquantity.text integerValue];
        int val3 = [txtshipingrate.text integerValue];
        int resultValue = val1  * val2 + val3;
        
        txtamount.text = [NSString stringWithFormat: @"%d", resultValue];
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Order Successfully Complited" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }

}
/*- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    
}*/

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([str isEqualToString:@"true"])
    {
        NSLog(@"true");
        UIViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"cell"];
        [self.navigationController pushViewController:category1 animated:YES];
    }
    else
    {
        NSLog(@"false");
       //loginViewController *category1=[self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
       // [self.navigationController pushViewController:category1 animated:YES];
        //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"please enter proper EmailId Or Password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        //[alert show];
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSLog(@"%@",[response description]);
}

- (IBAction)makecomplain:(id)sender {
    complainViewController *com=[self.storyboard instantiateViewControllerWithIdentifier:@"complain"];
    [self.navigationController pushViewController:com animated:YES];
    
    
}
- (IBAction)btnprice:(id)sender {
}

- (IBAction)btnname:(id)sender {
}

- (IBAction)btnquantity:(id)sender {
}

- (IBAction)btnaddress:(id)sender {
}

- (IBAction)btndate:(id)sender {
}

- (IBAction)btncity:(id)sender {
}

- (IBAction)btnstate:(id)sender {
}

- (IBAction)btnshippingrate:(id)sender {
}

- (IBAction)btnamount:(id)sender {
}
@end
