//
//  AppDelegate.m
//  Street_Food
//
//  Created by pinu on 08/09/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "AppDelegate.h"

@import GoogleMaps;
@import GooglePlaces;
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databasePath;
@synthesize userEmailID,ChkSkip,usts;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];

    [self dbCopied];
    
    [GMSServices provideAPIKey:@"AIzaSyAnj6bnucEdN2sPdq_CHBb2vWw5kW7wOdg"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyBCmT_BNtZMNkU5u85yq77-VPYJIvY99N8"];

    return YES;
}

// NSMutableArray *statusUser = [model SelectUser:@"select * from tblUserActive"];
-(void) dbCopied{
    
    
    NSArray *arrDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    NSString *strPath = [arrDir objectAtIndex:0];
    
    
    self.databasePath = [strPath stringByAppendingPathComponent:@"databaseUser.sqlite"];
    
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:self.databasePath]){
        
        BOOL isDone = false;
        
        NSString *filepath = [[NSBundle mainBundle]pathForResource:@"databaseUser" ofType:@"sqlite"];
        
        isDone = [[NSFileManager defaultManager] copyItemAtPath:filepath toPath:self.databasePath error:nil];
        
        if(isDone)
        {
            NSLog(@"File Copied");
        }
        else{
            NSLog(@"File Not Copied");
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
