//
//  showNotesViewController.h
//  SqliteDesigning
//
//  Created by mac on 3/18/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showNotesViewController : UIViewController
- (IBAction)save_notes:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *show_notes;
@property (strong,nonatomic)NSNumber *Login_id,*title_id;
@property (weak, nonatomic) IBOutlet UITextField *note_title;
@property(strong,nonatomic)NSArray *title_arr;

@property(strong,nonatomic )NSMutableArray *notes_arr;
@property (strong,nonatomic)NSString *str;
@end
