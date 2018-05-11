//
//  ChatViewController.h
//  ChatFirebase
//
//  Created by TOPS on 12/30/16.
//  Copyright © 2016 TOPS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppState.h"
#import "Constants.h"
#import "MeasurementHelper.h"
@import Firebase;
@import Photos;

@interface ChatViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,
UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    int _msglength;
    FIRDatabaseHandle _refHandle;
}

@property (weak, nonatomic) IBOutlet UIButton *signout;
@property (weak, nonatomic) IBOutlet UITextField *txt_msgtype;
@property (weak, nonatomic) IBOutlet UIButton *msgsend;
@property (weak, nonatomic) IBOutlet UIButton *selectphoto;
@property (weak, nonatomic) IBOutlet UITableView *msgtabledata;

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray<FIRDataSnapshot *> *messages;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;

- (IBAction)btn_signout:(id)sender;
- (IBAction)btn_photo:(id)sender;
- (IBAction)btn_msgsend:(id)sender;

@end
