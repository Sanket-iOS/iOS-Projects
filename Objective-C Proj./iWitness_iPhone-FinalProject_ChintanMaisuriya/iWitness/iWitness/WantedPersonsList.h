//
//  WantedPersonsList.h
//  iWitness
//
//  Created by MACOS on 6/24/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WantedPersonsList : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *getWPDetails;
    NSMutableArray *searchWPList;
    
    UIBarButtonItem *rightBarItem;
    int flag;
}

@property (strong, nonatomic) IBOutlet UICollectionView *WPCollectionList;
@property (nonatomic,strong) UISearchBar *wplSearchBar;
@property (nonatomic, assign) bool isFiltered;

@end
