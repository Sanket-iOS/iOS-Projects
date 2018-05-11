//
//  AppDelegate.h
//  Care4Earth
//
//  Created by tops on 2/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic)HomeViewController *HomeViewController;
@property(strong,nonatomic)UINavigationController *navigationcontroller;
@property(strong,nonatomic)UINavigationController *unc;

@end
