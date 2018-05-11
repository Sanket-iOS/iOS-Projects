//
//  panViewController.h
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface panViewController : UIViewController
{
    NSMutableData *datamute;
    NSString *elemntnm;
    NSMutableString *address;
    NSMutableString *dob;
    NSMutableString *ffullname;
    NSMutableString *fullname;
    NSMutableString *pan;
    NSMutableArray *arrmute;
    NSMutableDictionary *dictmute;
}
@property (weak, nonatomic) IBOutlet UITableView *tblview;
@property(retain,nonatomic)NSString *strpan;

@end
