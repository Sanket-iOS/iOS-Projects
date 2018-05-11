//
//  saveNoteViewController.h
//  SqliteDesigning
//
//  Created by mac on 3/18/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface saveNoteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSNumber *Login_id;


- (IBAction)edit_note:(id)sender;
@property(nonatomic,strong)NSMutableArray *title_arr,*date_arr;
@property (weak, nonatomic) IBOutlet UITableView *note_tableview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
