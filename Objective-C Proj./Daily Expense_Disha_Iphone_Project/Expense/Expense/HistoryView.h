//
//  HistoryView.h
//  Expense
//
//  Created by mac on 2/20/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryView : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * history;
    NSArray * his_desc;
    
}

@end
