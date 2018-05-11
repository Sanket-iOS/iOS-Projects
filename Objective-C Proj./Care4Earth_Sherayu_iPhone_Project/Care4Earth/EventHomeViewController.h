//
//  EventHomeViewController.h
//  Care4Earth
//
//  Created by tops on 2/12/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventHomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)btnback:(id)sender;
@property(strong,nonatomic)NSMutableArray *data;

@end
