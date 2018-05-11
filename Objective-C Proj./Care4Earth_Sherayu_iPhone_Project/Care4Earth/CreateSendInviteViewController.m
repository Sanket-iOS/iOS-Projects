//
//  CreateSendInviteViewController.m
//  Care4Earth
//
//  Created by mac on 3/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "CreateSendInviteViewController.h"
#import "SendMessageViewController.h"
#import <Social/Social.h>
#import "HomeMenuViewController.h"
#import "NewCollectionViewCell.h"
@interface CreateSendInviteViewController ()

@end

@implementation CreateSendInviteViewController
@synthesize data,images;
- (void)viewDidLoad {
     //    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    [self.collectionview registerNib:[UINib nibWithNibName:@"NewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    self.collectionview.backgroundView =[[UIView alloc]initWithFrame:self.collectionview.bounds];
   // UIImageView *imgVW=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    //[self.collectionview.backgroundView addSubview:imgVW];
    data=[NSMutableArray arrayWithObjects:@"Send Message",@"Share on Fb",@"Share on twitter",@"Send Mail",nil];
    
    images=[NSMutableArray arrayWithObjects:@"Message-32.png",@"Facebook-32.png",@"Twitter-32.png",@"Gmail Login-32.png", nil];

     [self.navigationItem setHidesBackButton:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    NSString *img=[images objectAtIndex:indexPath.row];
    cell.imgview.image = [UIImage imageNamed:img];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        SendMessageViewController *send=[[SendMessageViewController alloc]initWithNibName:@"SendMessageViewController" bundle:nil];
        [self.navigationController pushViewController:send animated:YES];
    }
    else if (indexPath.row == 1)
    {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Testing Posting to Facebook"];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else if (indexPath.row == 2)
    {
        
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Testing Post on Twitter!"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        
        NSString *string = @"share";
        self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[string] applicationActivities:nil];
        [self presentViewController:self.activityViewController animated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 50)
    {
        
        if(buttonIndex!=[alertView cancelButtonIndex ])
        {
            HomeMenuViewController *reg =[[HomeMenuViewController alloc]initWithNibName:@"HomeMenuViewController" bundle:nil];
            [self.navigationController pushViewController:reg animated:YES];
        }
        else
        {
            
        }
    }
}


- (IBAction)btnback:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Wish to Invite ?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag = 50;
    [alert show];
    
}
@end
