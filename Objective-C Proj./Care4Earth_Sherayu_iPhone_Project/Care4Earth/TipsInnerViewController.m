//
//  TipsInnerViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "TipsInnerViewController.h"

@interface TipsInnerViewController ()

@end

@implementation TipsInnerViewController
@synthesize tipsid,txtview,ardata,urldata;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    
    //int fid=[strname intValue];
   
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/tips/gettipsid?id=%@",tipsid];
    
   
    NSLog(@"%@", strurl);
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    ardata = [[NSMutableArray alloc]init];
    ardata =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //urldata = [[NSMutableArray alloc]init];
  //  urldata = []
   // NSArray *attachments = [[ardata objectForKey:@"page"] objectForKey:@"attachments"];
    for(NSDictionary *object in ardata)
    {
        NSString *name = [object objectForKey:@"TipDetails"];
        //NSLog(@"%@", [object objectForKey:@"images"]);
        //NSLog(@"%@", [[[object objectForKey:@"images"] objectForKey:@"full"] objectForKey:@"url"]);
         txtview.text = name;
    }
   
    //foodcat =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    //NSLog(@"%@",foodcat);
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

- (IBAction)btnback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnlogout:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
