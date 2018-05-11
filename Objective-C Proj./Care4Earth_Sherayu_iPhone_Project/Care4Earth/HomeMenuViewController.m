//
//  HomeMenuViewController.m
//  Care4Earth
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "HomeMenuViewController.h"
#import "NewCollectionViewCell.h"
#import "EventHomeViewController.h"
#import "PetitionHomeViewController.h"
#import "TipsMainViewController.h"
#import "ArticleHomeViewController.h"
#import "NGOViewController.h"
#import "NewsViewController.h"
#import "HomeViewController.h"

@interface HomeMenuViewController ()

@end

@implementation HomeMenuViewController
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.collectionview registerNib:[UINib nibWithNibName:@"NewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    self.collectionview.backgroundView =[[UIView alloc]initWithFrame:self.collectionview.bounds];
  //  UIImageView *imgVW=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    //[self.collectionview.backgroundView addSubview:imgVW];
    data=[NSMutableArray arrayWithObjects:@"Events",@"Petitions",@"Articles",@"Tips",@"Latest News",@"NGO's Supporting",nil];
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *LogOut = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Log Out"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(btnLog:)];
    self.navigationItem.rightBarButtonItem = LogOut;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)btnLog:(id)sender
{
    
    HomeViewController *reg =[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:reg animated:YES];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
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
        EventHomeViewController *reg =[[EventHomeViewController alloc]initWithNibName:@"EventHomeViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if(indexPath.row == 1)
    {
        PetitionHomeViewController *reg =[[PetitionHomeViewController alloc]initWithNibName:@"PetitionHomeViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if(indexPath.row == 2)
    {
        ArticleHomeViewController *reg =[[ArticleHomeViewController alloc]initWithNibName:@"ArticleHomeViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if(indexPath.row == 3)
    {
        TipsMainViewController *reg =[[TipsMainViewController alloc]initWithNibName:@"TipsMainViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else if(indexPath.row == 4)
    {
        NewsViewController *reg=[[NewsViewController alloc]initWithNibName:@"NewsViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }
    else
    {
        NGOViewController *reg =[[NGOViewController alloc]initWithNibName:@"NGOViewController" bundle:nil];
        [self.navigationController pushViewController:reg animated:YES];
    }

}
- (IBAction)btnlogout:(id)sender {
     [self.navigationController popToRootViewControllerAnimated:YES];
    UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"alert" message:@"Successfully Logged out" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alr show];
}
@end
