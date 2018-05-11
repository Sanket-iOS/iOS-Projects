//
//  NewsViewController.h
//  Care4Earth
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
}
@property (weak, nonatomic) IBOutlet UITableView *tblview;
- (IBAction)btnBack:(id)sender;
@end
