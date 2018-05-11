//
//  PetitionHomeViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PetitionHomeViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
- (IBAction)btnback:(id)sender;
@property(strong,nonatomic)NSMutableArray *data;
@end
