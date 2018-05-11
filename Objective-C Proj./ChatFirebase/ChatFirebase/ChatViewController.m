//
//  ChatViewController.m
//  ChatFirebase
//
//  Created by TOPS on 12/30/16.
//  Copyright © 2016 TOPS. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize msgsend,msgtabledata,selectphoto,signout,txt_msgtype;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _msglength = 10;
    _messages = [[NSMutableArray alloc] init];
    [msgtabledata registerClass:UITableViewCell.self forCellReuseIdentifier:@"tableViewCell"];
    
    [self configureDatabase];
    [self configureStorage];
    [self configureRemoteConfig];
    [self fetchConfig];
    //[self loadAd];
    //[self logViewLoaded];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    [[_ref child:@"messages"] removeObserverWithHandle:_refHandle];
}

- (void)configureDatabase
{
    _ref = [[FIRDatabase database] reference];
    // Listen for new messages in the Firebase database
    _refHandle = [[_ref child:@"messages"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot *snapshot) {
        [_messages addObject:snapshot];
        [msgtabledata insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_messages.count-1 inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
    }];
}

- (void)configureStorage
{
    NSString *storageUrl = [FIRApp defaultApp].options.storageBucket;
    self.storageRef = [[FIRStorage storage] referenceForURL:[NSString stringWithFormat:@"gs://%@", storageUrl]];
}

- (void)configureRemoteConfig
{
    _remoteConfig = [FIRRemoteConfig remoteConfig];
    // Create Remote Config Setting to enable developer mode.
    // Fetching configs from the server is normally limited to 5 requests per hour.
    // Enabling developer mode allows many more requests to be made per hour, so developers
    // can test different config values during development.
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] initWithDeveloperModeEnabled:YES];
    self.remoteConfig.configSettings = remoteConfigSettings;
}

- (void)fetchConfig
{
    long expirationDuration = 3600;
    // If in developer mode cacheExpiration is set to 0 so each fetch will retrieve values from
    // the server.
    if (self.remoteConfig.configSettings.isDeveloperModeEnabled) {
        expirationDuration = 0;
    }
    
    // cacheExpirationSeconds is set to cacheExpiration here, indicating that any previously
    // fetched and cached config would be considered expired because it would have been fetched
    // more than cacheExpiration seconds ago. Thus the next fetch would go to the server unless
    // throttling is in progress. The default expiration duration is 43200 (12 hours).
    [self.remoteConfig fetchWithExpirationDuration:expirationDuration completionHandler:^(FIRRemoteConfigFetchStatus status, NSError *error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            NSLog(@"Config fetched!");
            [_remoteConfig activateFetched];
            FIRRemoteConfigValue *friendlyMsgLength = _remoteConfig[@"friendly_msg_length"];
            if (friendlyMsgLength.source != FIRRemoteConfigSourceStatic) {
                _msglength = friendlyMsgLength.numberValue.intValue;
                NSLog(@"Friendly msg length config: %d", _msglength);
            }
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    NSString *text = textField.text;
    if (!text) {
        return YES;
    }
    long newLength = text.length + string.length - range.length;
    return (newLength <= _msglength);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // Dequeue cell
    UITableViewCell *cell = [msgtabledata dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    // Unpack message from Firebase DataSnapshot
    FIRDataSnapshot *messageSnapshot = _messages[indexPath.row];
    NSDictionary<NSString *, NSString *> *message = messageSnapshot.value;
    NSString *name = message[MessageFieldsname];
    NSString *imageURL = message[MessageFieldsimageURL];
    if (imageURL) {
        if ([imageURL hasPrefix:@"gs://"]) {
            [[[FIRStorage storage] referenceForURL:imageURL] dataWithMaxSize:INT64_MAX
                                                                  completion:^(NSData *data, NSError *error) {
                                                                      if (error) {
                                                                          NSLog(@"Error downloading: %@", error);
                                                                          return;
                                                                      }
                                                                      cell.imageView.image = [UIImage imageWithData:data];
                                                                      [tableView reloadData];
                                                                  }];
        } else {
            cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"sent by: %@", name];
    } else {
        NSString *text = message[MessageFieldstext];
        cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", name, text];
        cell.imageView.image = [UIImage imageNamed: @"ic_account_circle"];
        NSString *photoURL = message[MessageFieldsphotoURL];
        if (photoURL) {
            NSURL *URL = [NSURL URLWithString:photoURL];
            if (URL) {
                NSData *data = [NSData dataWithContentsOfURL:URL];
                if (data) {
                    cell.imageView.image = [UIImage imageWithData:data];
                }
            }
        }
    }
    return cell;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self sendMessage:@{MessageFieldstext: textField.text}];
    textField.text = @"";
    [self.view endEditing:YES];
    return YES;
}

- (void)sendMessage:(NSDictionary *)data
{
    NSMutableDictionary *mdata = [data mutableCopy];
    mdata[MessageFieldsname] = [AppState sharedInstance].displayName;
    NSURL *photoURL = AppState.sharedInstance.photoURL;
    if (photoURL) {
        mdata[MessageFieldsphotoURL] = [photoURL absoluteString];
    }
    
    // Push data to Firebase Database
    [[[_ref child:@"messages"] childByAutoId] setValue:mdata];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_signout:(id)sender
{
    FIRAuth *firebaseAuth = [FIRAuth auth];
    NSError *signOutError;
    BOOL status = [firebaseAuth signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }
    [AppState sharedInstance].signedIn = false;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn_photo:(id)sender
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    NSURL *referenceURL = info[UIImagePickerControllerReferenceURL];
    // if it's a photo from the library, not an image from the camera
    if (referenceURL) {
        
        
        
        PHFetchResult* assets = [PHAsset fetchAssetsWithALAssetURLs:@[referenceURL] options:nil];
        PHAsset *asset = [assets firstObject];
        [asset requestContentEditingInputWithOptions:nil
                                   completionHandler:^(PHContentEditingInput *contentEditingInput, NSDictionary *info) {
                                       NSURL *imageFile = contentEditingInput.fullSizeImageURL;
                                       NSString *filePath = [NSString stringWithFormat:@"%@/%lld/%@",
                                                             [FIRAuth auth].currentUser.uid,
                                                             (long long)([[NSDate date] timeIntervalSince1970] * 1000.0),
                                                             [referenceURL lastPathComponent]];
                                       [[_storageRef child:filePath]
                                        putFile:imageFile metadata:nil
                                        completion:^(FIRStorageMetadata *metadata, NSError *error) {
                                            if (error) {
                                                NSLog(@"Error uploading: %@", error);
                                                return;
                                            }
                                            [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description}];
                                        }
                                        ];
                                   }];
    } else {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
        NSString *imagePath =
        [NSString stringWithFormat:@"%@/%lld.jpg",
         [FIRAuth auth].currentUser.uid,
         (long long)([[NSDate date] timeIntervalSince1970] * 1000.0)];
        FIRStorageMetadata *metadata = [FIRStorageMetadata new];
        metadata.contentType = @"image/jpeg";
        [[_storageRef child:imagePath] putData:imageData metadata:metadata
                                    completion:^(FIRStorageMetadata * _Nullable metadata, NSError * _Nullable error) {
                                        if (error) {
                                            NSLog(@"Error uploading: %@", error);
                                            return;
                                        }
                                        [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description}];
                                    }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)btn_msgsend:(id)sender
{
    [self textFieldShouldReturn:txt_msgtype];
}
@end
