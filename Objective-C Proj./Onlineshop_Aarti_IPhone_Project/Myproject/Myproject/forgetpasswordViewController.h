//
//  forgetpasswordViewController.h
//  Myproject
//
//  Created by tops on 1/16/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgetpasswordViewController : UIViewController<NSXMLParserDelegate,UITextFieldDelegate,NSURLConnectionDelegate>
{
    NSMutableData *maildata;
    NSXMLParser *xmlParser;
    NSURLConnection *currentConnection;
    NSString *elementnm;
}

@property (weak, nonatomic) IBOutlet UITextField *txtto;
@property (weak, nonatomic) IBOutlet UITextField *txtsub;
@property (weak, nonatomic) IBOutlet UITextField *txtmsg;

- (IBAction)btngo:(id)sender;

@end
