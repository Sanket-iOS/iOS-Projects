//
//  AppDelegate.h
//  Street_Food
//
//  Created by pinu on 08/09/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int uStatus;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *ChkSkip;
@property (strong,nonatomic)NSString *usts;

@property (strong, nonatomic) NSString *userEmailID;
@end

