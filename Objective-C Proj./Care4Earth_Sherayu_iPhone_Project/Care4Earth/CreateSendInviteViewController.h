//
//  CreateSendInviteViewController.h
//  Care4Earth
//
//  Created by mac on 3/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateSendInviteViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>
- (IBAction)btnsms:(id)sender;
- (IBAction)shareFB:(id)sender;
- (IBAction)shareTwitter:(id)sender;
@property (nonatomic, strong) UIActivityViewController *activityViewController;
- (IBAction)btnshare:(id)sender;
- (IBAction)btnlater:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSMutableArray *data;
@property(retain,nonatomic)NSMutableArray *images;
@end
