//
//  SelectArticleViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "SelectArticleViewController.h"

@interface SelectArticleViewController ()

@end

@implementation SelectArticleViewController
@synthesize tipsid,ardata;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *strurl=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/getarticleid/?catid=3"];
    
    NSURL *url=[[NSURL alloc]initWithString:strurl];
    
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    ardata=[[NSMutableArray alloc]init];
    ardata =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    

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

- (IBAction)btnBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
