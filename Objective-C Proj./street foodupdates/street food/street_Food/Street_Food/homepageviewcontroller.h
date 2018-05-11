//
//  homepageviewcontroller.h
//  Street_Food
//
//  Created by Tops on 9/9/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homepageviewcontroller : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view1;
- (IBAction)menu_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *sideview;
@property (strong,nonatomic) NSArray *arrdata;

@property (weak, nonatomic) IBOutlet UITableView *sidebar;

@end
