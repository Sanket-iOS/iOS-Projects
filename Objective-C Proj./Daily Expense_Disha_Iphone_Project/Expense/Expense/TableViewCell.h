//
//  TableViewCell.h
//  Expense
//
//  Created by tops on 2/11/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *MyImageview;
@property (weak, nonatomic) IBOutlet UILabel *labelNm;
@property (weak, nonatomic) IBOutlet UILabel *lbldesc;


@end
