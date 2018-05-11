//
//  MissingPersonList.h
//  iWitness
//
//  Created by MACOS on 6/22/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissingPersonList : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *getMPDetails;
    NSMutableArray *searchMPList;
    
    UIBarButtonItem *rightBarItem;


}

@property (strong, nonatomic) IBOutlet UICollectionView *MPCollectionList;
@property (nonatomic,strong) UISearchBar *mplSearchBar;
@property (nonatomic, assign) bool isFiltered;

@end
