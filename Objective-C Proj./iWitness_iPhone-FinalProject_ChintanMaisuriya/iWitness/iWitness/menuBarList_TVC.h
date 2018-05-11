//
//  menuBarList_TVC.h
//  iWitness
//
//  Created by MACOS on 6/20/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuBarList_TVC : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arrMLImgs;
    NSArray *arrMLNames;
    
    NSMutableArray *getUserData;
}
@property (strong, nonatomic) IBOutlet UITableView *menubarListTVC;

@end
