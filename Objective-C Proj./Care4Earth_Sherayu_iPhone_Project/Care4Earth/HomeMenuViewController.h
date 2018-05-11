//
//  HomeMenuViewController.h
//  Care4Earth
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeMenuViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)btnlogout:(id)sender;
@property(strong,nonatomic)NSMutableArray *data;
@end
