//
//  Settings.h
//  Expense
//
//  Created by tops on 2/24/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbOperation.h"
@interface Settings : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *CurrencyTable;
    NSArray *Currency;
    NSArray *CurrencyCodes;
    NSMutableArray *ArrCategory;
  
}

- (IBAction)Radio1Click:(id)sender;
- (IBAction)Radio2Click:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Radio1Button;
@property (strong, nonatomic) IBOutlet UIButton *Radio2Button;
- (IBAction)SelectCuurencyClick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *DateFormateMessage;
@property (weak, nonatomic) IBOutlet UITextField *cidBOX;
@property (weak, nonatomic) IBOutlet UITextField *CNameBox;
- (IBAction)AddCategory:(id)sender;
- (IBAction)EditCategory:(id)sender;

- (IBAction)DeleteCategory:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *CurrecyBox;
@end
