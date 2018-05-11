//
//  PoliceOfficailDetail.m
//  iWitness
//
//  Created by MACOS on 9/1/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "PoliceOfficailDetail.h"

@interface PoliceOfficailDetail ()

@end

@implementation PoliceOfficailDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=NO;
    
    _viewPOInfo.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewPOInfo.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewPOInfo.layer.shadowOffset=CGSizeMake(0,0);
    _viewPOInfo.layer.shadowOpacity=0.5;
    _viewPOInfo.layer.shadowRadius=2.0;
    _viewPOInfo.layer.cornerRadius=5;
    
    _lblPOName.textColor = [UIColor whiteColor];
    _lblPOPost.textColor = [UIColor whiteColor];
    _lblPOContact.textColor = [UIColor whiteColor];

    
    getPODetails = [[NSArray alloc]init];
    
    NSUserDefaults *poDef = [NSUserDefaults standardUserDefaults];
    getPODetails = [poDef valueForKey:@"poDetails"];
    
    _lblPOName.text = [getPODetails objectAtIndex:0];
    _lblPOPost.text = [getPODetails objectAtIndex:1];
    _lblPOContact.text = [getPODetails objectAtIndex:2];
    
    _imgPO.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getPODetails objectAtIndex:3]]]];
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
