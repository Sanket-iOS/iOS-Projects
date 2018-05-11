//
//  subproductlistViewController.h
//  Myproject
//
//  Created by tops on 1/4/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface subproductlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *mancloatharr;
    NSArray *womanclotharr;
    NSArray *kidclotharr;
}
@property(assign,nonatomic)NSUInteger data;
@end
