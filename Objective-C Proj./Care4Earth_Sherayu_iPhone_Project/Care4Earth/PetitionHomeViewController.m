      //
//  PetitionHomeViewController.m
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "PetitionHomeViewController.h"
#import "StartPetitionViewController.h"
#import "CategoryPetitionViewController.h"
#import "MyPetitionsViewController.h"
#import "SignedPetitionViewController.h"
#import "NewCollectionViewCell.h"
#import "HomeMenuViewController.h"
@interface PetitionHomeViewController ()

@end

@implementation PetitionHomeViewController
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.collectionview registerNib:[UINib nibWithNibName:@"NewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    self.collectionview.backgroundView =[[UIView alloc]initWithFrame:self.collectionview.bounds];
    UIImageView *imgVW=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.collectionview.backgroundView addSubview:imgVW];
    data=[NSMutableArray arrayWithObjects:@"Start Petition",@"Browse Petitions",@"Petitions started",@"Petitions Signed",nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    NSString *name=[data objectAtIndex:indexPath.row];
    cell.customLabel.text = name;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        StartPetitionViewController *reg =[[StartPetitionViewController alloc]initWithNibName:@"StartPetitionViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if (indexPath.row == 1)
    {
        CategoryPetitionViewController *reg =[[CategoryPetitionViewController alloc]initWithNibName:@"CategoryPetitionViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if (indexPath.row == 2)
    {
        
        MyPetitionsViewController *reg =[[MyPetitionsViewController alloc]initWithNibName:@"MyPetitionsViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];

    }
    else
    {
        
        SignedPetitionViewController *create=[[SignedPetitionViewController alloc]initWithNibName:@"SignedPetitionViewController" bundle:nil];
        [self.navigationController pushViewController:create animated:YES];
    }
}

- (IBAction)btnback:(id)sender {
    HomeMenuViewController *home=[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
}
@end
