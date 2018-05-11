//
//  NSnotificationViewController.m
//  Myproject
//
//  Created by tops on 3/26/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "NSnotificationViewController.h"

@interface NSnotificationViewController ()

@end

@implementation NSnotificationViewController
bool allowNotif;
bool allowsSound;
bool allowsBadge;
bool allowsAlert;
@synthesize customMessage,datePicker,frequencySegmentedControl;
- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
   notification = [[UILocalNotification alloc] init];
    if (notification)
    {
        notification.fireDate = datePicker.date;
        notification.timeZone = [NSTimeZone defaultTimeZone];
        notification.applicationIconBadgeNumber = 1;
        notification.soundName = UILocalNotificationDefaultSoundName;
        switch (frequencySegmentedControl.selectedSegmentIndex) {
            case 0:
                notification.repeatInterval = NSCalendarUnitDay;
                break;
            case 1:
                notification.repeatInterval = NSCalendarUnitWeekOfYear;
                break;
            case 2:
                notification.repeatInterval = NSCalendarUnitYear;
                break;
            default:
                notification.repeatInterval = 0;
                break;
        }
        notification.alertBody = customMessage.text;
    }
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    // this will fire the notification right away, it will still also fire at the date we set
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyy hh:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
    NSString *notifDate = [formatter stringFromDate:datePicker.date];
    NSLog(@"%s: fire time = %@", __PRETTY_FUNCTION__, notifDate);
    [super viewDidLoad];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setNotificationTypesAllowed
{
    NSLog(@"%s:", __PRETTY_FUNCTION__);
    // get the current notification settings
    UIUserNotificationSettings *currentSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    allowNotif = (currentSettings.types != UIUserNotificationTypeNone);
    allowsSound = (currentSettings.types & UIUserNotificationTypeSound) != 0;
    allowsBadge = (currentSettings.types & UIUserNotificationTypeBadge) != 0;
    allowsAlert = (currentSettings.types & UIUserNotificationTypeAlert) != 0;
     [self setNotificationTypesAllowed];
    if (notification)
    {
        if (allowNotif)
        {
            notification.fireDate = datePicker.date;
            notification.timeZone = [NSTimeZone defaultTimeZone];
            switch (frequencySegmentedControl.selectedSegmentIndex) {
                case 0:
                    notification.repeatInterval = NSCalendarUnitDay;
                    break;
                case 1:
                    notification.repeatInterval = NSCalendarUnitWeekOfYear;
                    break;
                case 2:
                    notification.repeatInterval = NSCalendarUnitYear;
                    break;
                default:
                    notification.repeatInterval = 0;
                    break;
            }
        }
        if (allowsAlert)
        {
            notification.alertBody =customMessage.text;
        }
        if (allowsBadge)
        {
            notification.applicationIconBadgeNumber = 1;
        }
        if (allowsSound)
        {
            notification.soundName = UILocalNotificationDefaultSoundName;
        }
        
        // this will schedule the notification to fire at the fire date
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        // this will fire the notification right away, it will still also fire at the date we set
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)btnsave:(id)sender {
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    }
@end
