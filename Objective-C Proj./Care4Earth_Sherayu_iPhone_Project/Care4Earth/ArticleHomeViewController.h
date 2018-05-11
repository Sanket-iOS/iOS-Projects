//
//  ArticleHomeViewController.h
//  Care4Earth
//
//  Created by tops on 2/13/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)btnback:(id)sender;
@property(retain,nonatomic)NSMutableArray *arrData;
@end
