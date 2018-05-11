//
//  AppDelegate.m
//  SqliteDesigning
//
//  Created by tops on 3/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize strDBPath;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self copyDatabase];
    

    
    UIImage *splashImage = [UIImage imageNamed:@"logo.jpg"];
    UIImageView *splashImageView = [[UIImageView alloc] initWithImage:splashImage];
    [self.window.rootViewController.view addSubview:splashImageView];
    [self.window.rootViewController.view bringSubviewToFront:splashImageView];
   
     [UIView animateWithDuration:1.5f
                          delay:2.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         splashImageView.alpha = .0f;
                         CGFloat x = -60.0f;
                         CGFloat y = -120.0f;
                         splashImageView.frame = CGRectMake(x,
                                                            y,
                                                            splashImageView.frame.size.width-2*x,
                                                            splashImageView.frame.size.height-2*y);
                     }
      
                      completion:^(BOOL finished){
                         if (finished) {
                             [splashImageView removeFromSuperview];
                         }
                     }];
    
    
   
    
      self.window.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"5.jpg"]];
    
    
    return YES;
    
}

-(void)copyDatabase
{
    NSArray *arrDoc=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str=[arrDoc objectAtIndex:0];
    strDBPath=[str stringByAppendingPathComponent:@"smartscheduler.db"];
    NSLog(@"%@",strDBPath);
    if(![[NSFileManager defaultManager]fileExistsAtPath:strDBPath])
    {
        NSString *localDB=[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"smartscheduler" ofType:@"db"]];
        [[NSFileManager defaultManager ]copyItemAtPath:localDB toPath:strDBPath error:nil];
                           
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
