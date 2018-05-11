//
//  JewelleryViewController.h
//  Myproject
//
//  Created by tops on 12/28/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JewelleryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *jewellerarr;
    NSArray *mobileassarr;
    NSArray *laptoparr;
    NSArray *watcharr;
    NSArray *musicalarr;
    NSArray *kitchenarr;
    NSArray *clotharr;
    NSArray *shoesarr;
    NSArray *memorycardarr;
    NSArray *mobilearr;
    BOOL isselect;
}
@property(assign,nonatomic)NSUInteger data;
@end
