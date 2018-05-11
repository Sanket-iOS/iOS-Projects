//
//  productlistViewController.h
//  Myproject
//
//  Created by tops on 1/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productlistViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
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
@property(retain,nonatomic)NSMutableString *str1;
@end
