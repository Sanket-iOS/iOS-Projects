//
//  ViewController.h
//  C_Helper
//
//  Created by mac on 4/1/15.
//  Copyright (c) 2015 ratan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *GeatData;
    NSMutableArray *filteredstring;
    BOOL isfiltered;
    
}

@property (weak, nonatomic) IBOutlet UISearchBar *SerchData;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;


@end

