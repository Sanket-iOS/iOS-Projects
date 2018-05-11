//
//  categoryViewController.h
//  Myproject
//
//  Created by tops on 12/27/14.
//  Copyright (c) 2014 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface categoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSArray *categoryarr;
NSMutableArray *sercharray;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
