//
//  History_Displaydata.h
//  Expense
//
//  Created by tops on 2/23/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface History_Displaydata : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
 
    NSArray *Hedding_Label;
    NSMutableArray *SelData;
    NSMutableArray *arrinc;
    
}
@property (strong, nonatomic) IBOutlet UILabel *Expense_Value;
@property (strong, nonatomic) IBOutlet UILabel *Income_Value;
@property(nonatomic)NSInteger Item;
@property (weak, nonatomic) IBOutlet UITableView *his_DisTable;
@property(nonatomic)NSString *Passemail;
@end
