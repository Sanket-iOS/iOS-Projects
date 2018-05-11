//
//  emailsending.h
//  IncomeTax
//
//  Created by tops on 4/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface emailsending : NSObject<NSXMLParserDelegate,UITextFieldDelegate,NSURLConnectionDelegate>
{
    NSMutableData *maildata;
    NSXMLParser *xmlParser;
    NSURLConnection *currentConnection;
    NSString *elementnm;
}
@property (weak, nonatomic) IBOutlet UITextField *txtto;
@property (weak, nonatomic) IBOutlet UITextField *txtsub;
@property (weak, nonatomic) IBOutlet UITextField *txtmsg;

-(void)SendEmail;
@end
