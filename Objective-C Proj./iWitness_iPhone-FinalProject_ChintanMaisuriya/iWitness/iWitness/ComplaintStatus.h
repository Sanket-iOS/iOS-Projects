//
//  ComplaintStatus.h
//  iWitness
//
//  Created by Tops on 8/27/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ComplaintStatus : UITableViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    NSString *strGetUID;
    NSString *compDateTime;
    
    NSMutableArray *getComplaintList;
    NSMutableArray *searchCSList;
    
    UIBarButtonItem *rightBarItem;
}

@property (strong, nonatomic) IBOutlet UITableView *complaintListTVC;
@property (nonatomic,strong) UISearchBar *cslSearchBar;
@property (nonatomic, assign) bool isFiltered;

@end
