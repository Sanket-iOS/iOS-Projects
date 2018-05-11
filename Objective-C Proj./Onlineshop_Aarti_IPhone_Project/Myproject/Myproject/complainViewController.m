//
//  complainViewController.m
//  Myproject
//
//  Created by tops on 2/26/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "complainViewController.h"

@interface complainViewController ()

@end

@implementation complainViewController
@synthesize txtdescription,txtdate,txtsubject;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];

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

-(void)select:(id)sender
{
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateStyle:NSDateFormatterMediumStyle];
    txtdate.text=[format stringFromDate:MyDatePicker.date];
    MyDatePicker.hidden=YES;
}
- (IBAction)btncustomerid:(id)sender {
}
- (IBAction)btndate:(id)sender {
}
- (IBAction)btnsubject:(id)sender {
}
- (IBAction)btndescription:(id)sender {
}

- (IBAction)selectdate:(id)sender {
    
    MyDatePicker=[[UIDatePicker alloc]init];
    [MyDatePicker setFrame:CGRectMake(0, 200, 320, 400)];
    [MyDatePicker addTarget:self action:@selector(select:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:MyDatePicker];}

- (IBAction)btncomplin:(id)sender {
    
    if([[txtdate text] isEqualToString:@""] || [[txtsubject text] isEqualToString:@""]||[[txtdescription text] isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"message" message:@"One of them is Empty so Complain in Failed!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        //countErr1=1;
    }
    else
    {
    NSDictionary *userdata=@{@"Date":txtdate.text, @"Subject":txtsubject.text,@"Description":txtdescription.text};
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://shopapi.somee.com/api/values/PostComplaint/"];
    NSData *postData=[NSJSONSerialization dataWithJSONObject:userdata options:0 error:nil];
    NSMutableURLRequest *requst=[NSMutableURLRequest requestWithURL:url];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:postData];
    [requst setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requst setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:requst delegate:self];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Complain Receive Successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

- (IBAction)btndesciption:(id)sender {
}
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data {
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    
}
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"%@",response);
}
@end
