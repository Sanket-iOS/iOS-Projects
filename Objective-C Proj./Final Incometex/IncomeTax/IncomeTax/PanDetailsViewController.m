//
//  PanDetailsViewController.m
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "PanDetailsViewController.h"
#import "panViewController.h"

#import "ShoetestViewController.h"

@interface PanDetailsViewController ()

@end

@implementation PanDetailsViewController
@synthesize txtfname,txtmname,txtlname,txtdate,datepicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
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

- (IBAction)btnPAN:(id)sender {
   /* panViewController *pn=[self.storyboard instantiateViewControllerWithIdentifier:@"panview"];
    pn.strpan=txtfname.text;
    [self.navigationController pushViewController:pn animated:YES];
    */
    
   
         ShoetestViewController *pn=[self.storyboard instantiateViewControllerWithIdentifier:@"showtest"];
    
    NSMutableString  *str=[[NSMutableString alloc]initWithString:txtfname.text];
      [str appendString:txtmname.text];
      [str appendString:txtlname.text];
      pn.fullname=str;
    [self.navigationController pushViewController:pn animated:YES];
    
    
    
    NSDate *date=datepicker.date;
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    NSString *strDate=[formatter stringFromDate:date];
    txtdate.text=strDate;

     
}
@end
