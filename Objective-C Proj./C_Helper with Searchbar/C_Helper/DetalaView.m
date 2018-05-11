//
//  DetalaView.m
//  C_Helper
//
//  Created by mac on 4/2/15.
//  Copyright (c) 2015 ratan. All rights reserved.
//

#import "DetalaView.h"

@interface DetalaView ()

@end

@implementation DetalaView
@synthesize lblName,str;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super  initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblName.text=[NSString stringWithFormat:@"%@",str];
    
    NSString *getstr=self.lblName.text;
    
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:getstr ofType:@"pdf"]];
    NSURLRequest *read=[[NSURLRequest alloc]initWithURL:url];
    [self.webview loadRequest:read];

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

@end
