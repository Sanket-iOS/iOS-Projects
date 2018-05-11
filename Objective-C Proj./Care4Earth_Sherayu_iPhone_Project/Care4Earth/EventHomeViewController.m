//
//  EventHomeViewController.m
//  Care4Earth
//
//  Created by tops on 2/12/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "EventHomeViewController.h"
#import "CreateEventViewController.h"
#import  "CheckEventsViewController.h"
#import "NewCollectionViewCell.h"
#import "EventJoinedViewController.h"
#import "EventCreatedViewController.h"
#import "HomeMenuViewController.h"
@interface EventHomeViewController ()

@end

@implementation EventHomeViewController
@synthesize data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.collectionview registerNib:[UINib nibWithNibName:@"NewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    self.collectionview.backgroundView =[[UIView alloc]initWithFrame:self.collectionview.bounds];
   // UIImageView *imgVW=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
   // [self.collectionview.backgroundView addSubview:imgVW];
    data=[NSMutableArray arrayWithObjects:@"Create Event",@"Check Events",@"Events created",@"Joined Events",nil];

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
        CreateEventViewController *create=[[CreateEventViewController alloc]initWithNibName:@"CreateEventViewController" bundle:nil];
        [self.navigationController pushViewController:create animated:YES];
    }
    else if (indexPath.row == 1)
    {
        CheckEventsViewController *create=[[CheckEventsViewController alloc]initWithNibName:@"CheckEventsViewController" bundle:nil];
        [self.navigationController pushViewController:create animated:YES];
    }
    else if (indexPath.row == 2)
    {
        
        EventCreatedViewController *create=[[EventCreatedViewController alloc]initWithNibName:@"EventCreatedViewController" bundle:nil];
        [self.navigationController pushViewController:create animated:YES];
    }
    else
    {
        
        EventJoinedViewController *create=[[EventJoinedViewController alloc]initWithNibName:@"EventJoinedViewController" bundle:nil];
        [self.navigationController pushViewController:create animated:YES];
    }
}
- (IBAction)btnback:(id)sender {
    HomeMenuViewController *home=[[HomeMenuViewController alloc]initWithNibName:@"" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
}
@end
