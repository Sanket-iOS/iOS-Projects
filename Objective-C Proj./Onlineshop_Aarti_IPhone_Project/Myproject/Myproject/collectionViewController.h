//
//  collectionViewController.h
//  Myproject
//
//  Created by tops on 2/14/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *laptoparr;
    NSArray *womanarr;
    NSArray *manarr;
    NSArray *childarr;
    NSArray *desktoparr;
    NSArray *tabletarr;
    NSArray *gitararr;
    NSArray *harmoniumarr;
    NSArray *recodingarr;
    NSArray *manwatcharr;
    NSArray *womanwatcharr;
    NSArray *pairwatcharr;
    NSArray *backingarr;
    NSArray *containerarr;
    NSArray *manchoesarr;
    NSArray *womanchoesarr;
    NSArray *diamondarr;
    NSArray *glodarr;
}
@property(weak,nonatomic)NSString *str;
@property(assign,nonatomic)NSUInteger data1,data;
@property(retain,nonatomic)NSMutableString *str3;
@end
