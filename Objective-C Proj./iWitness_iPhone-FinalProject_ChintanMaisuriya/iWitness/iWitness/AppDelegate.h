//
//  AppDelegate.h
//  iWitness
//
//  Created by MAC OS on 5/26/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>{
    
    UIAlertController *altError;
    //UIWindow *alertWindow;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) NSString *currentLocAddress;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

