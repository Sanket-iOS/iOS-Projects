//
//  subproductlistViewController.m
//  Myproject
//
//  Created by tops on 1/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "subproductlistViewController.h"

@interface subproductlistViewController ()

@end

@implementation subproductlistViewController
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    mancloatharr=[[NSArray alloc]initWithObjects:@"T-Shirts",@"Formal Shirts",@"Casual Shirts",@"Jeans",@"Trousers",@"Shorts",@"Sweaters",@"Coats & Jackets",@"Sleepwear",@"Swimwear",@"Boxer",@"", nil];
    womanclotharr=[[NSArray alloc]initWithObjects:@"Sarees",@"Kurtis",@"Dress Materials",@"Salwar Suits",@"T-Shirts",@"Tops & Shirts",@"Jeans",@"Trousers",@"Shorts",@"Skirts",@"Lehenga Cholis",@"Leggings",@"Dupatta",@"Sportswear",@"Sweaters",@"Coats & Jackets",@"Scarves & stole",@"Shawls",@"Swimwears", nil];
    kidclotharr=[[NSArray alloc]initWithObjects:@"T-Shirts",@"Tops & Shirts",@"Dresses",@"Jackets",@"Pants",@"Shorts",@"Skirts",@"Jeans",@"Sportswear",@"Sweaters",@"Swimwears",@"Sleepwear", nil];
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

@end
