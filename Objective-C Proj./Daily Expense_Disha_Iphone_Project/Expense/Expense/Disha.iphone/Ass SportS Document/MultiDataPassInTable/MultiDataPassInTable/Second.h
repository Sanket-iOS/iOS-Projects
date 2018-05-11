//
//  Second.h
//  MultiDataPassInTable
//
//  Created by tops on 1/12/15.
//  Copyright (c) 2015 Disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Second : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *sub;
}
@property (weak,nonatomic)NSString *brandName;

@end
