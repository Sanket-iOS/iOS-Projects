//
//  TellPeopleViewController.h
//  Care4Earth
//
//  Created by tops on 3/20/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TellPeopleViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UIAlertViewDelegate>

@property (nonatomic, strong) UIActivityViewController *activityViewController;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
@property(retain,nonatomic)NSMutableArray *data;
@property(retain,nonatomic)NSMutableArray *images;
- (IBAction)btnback:(id)sender;
@end
