//
//  SendMessageViewController.m
//  Care4Earth
//
//  Created by mac on 2/24/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "SendMessageViewController.h"
#import <AddressBook/AddressBook.h>
#import <MessageUI/MessageUI.h>

@interface SendMessageViewController ()

@end

@implementation SendMessageViewController
@synthesize contacts,selectedcontacts,PhoneList;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    contacts = [[NSMutableArray alloc] init];
   /* for(int i = 1; i <= 20; i++) {
        [contacts addObject:[NSString stringWithFormat:@"Option %i", i]];
    }*/
    selectedcontacts = [[NSMutableArray alloc] init];
       [self GetAddress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}
-(NSArray *)getSelections {
    NSMutableArray *selections = [[NSMutableArray alloc] init];
    
    for(NSIndexPath *indexPath in selectedcontacts) {
        [selections addObject:[contacts objectAtIndex:indexPath.row]];
    }
  NSLog(@"%@",[selectedcontacts description]);
    return selections;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    }
    
    cell.textLabel.text = [contacts objectAtIndex:indexPath.row];
    if([selectedcontacts containsObject:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedcontacts addObject:indexPath];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [selectedcontacts removeObject:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)GetAddress
{
    //NSMutableArray *result = [[NSMutableArray alloc] init];
    CFErrorRef *error = nil;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
    __block BOOL accessGranted = YES;
    
    if (ABAddressBookRequestAccessWithCompletion != NULL){
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }
    else{
        accessGranted = YES;
    }
    if (accessGranted){
        // If the app is authorized to access the first time then add the contact
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
        
        for (int i=0; i<numberOfPeople; i++){
           
            ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
            CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
            CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
            CFStringRef phone=ABRecordCopyValue(person, kABPersonPhoneProperty);
          //  NSString *userName = @"NoName";
            
         //   NSLog(@"%@",firstName);
            
            NSString *fname=[[NSString alloc]initWithFormat:@"%@",firstName];
            NSString *lname=[[NSString alloc]initWithFormat:@"%@",lastName];
            NSString *phoneno=[[NSString alloc]initWithFormat:@"%@",phone];
            NSString *fullname=[[NSString alloc]initWithFormat:@"%@ %@",fname,lname];
            
            [contacts addObject:fullname];
                   }
    }
    NSLog(@"%@",[contacts description]);
    
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Message was cancelled");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message failed");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MessageComposeResultSent:
            NSLog(@"Message was sent");
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        default:
            break;
    }
}
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSMutableArray *)recipients
{
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
   

       if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }    
}
- (IBAction)btnsend:(id)sender {
    [self getSelections];
    [self sendSMS:@"abc" recipientList:selectedcontacts];
}
- (IBAction)btnback:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Wish To send?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.tag = 50;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag == 50){
        if(buttonIndex!=[alertView cancelButtonIndex ])
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else
        {
        }
    }
    
    
}

@end
