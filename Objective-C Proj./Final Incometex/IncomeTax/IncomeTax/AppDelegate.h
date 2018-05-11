//
//  AppDelegate.h
//  IncomeTax
//
//  Created by tops on 3/16/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(retain,nonatomic)NSString *DBPath;
-(void)CopyPasteDB;

@property(retain,nonatomic)NSString *strpassword;
@property(retain,nonatomic)NSString *strEmail;

@end
