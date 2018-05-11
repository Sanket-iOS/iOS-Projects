//
//  homeViewController.m
//  Myproject
//
//  Created by tops on 12/28/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(goToNext) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}
int cout=0;

//-(void)viewWillAppear:(BOOL)animated
//{
  //  self.navigationController.navigationBar.hidden=YES;
//}

-(void)goToNext
{
    self.view.alpha-=0.1;
    if(cout==4)
    {
        UIViewController *lV=[self.storyboard instantiateViewControllerWithIdentifier:@"registration"];
        [self.navigationController pushViewController:lV animated:YES];
    }
    cout++;
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
