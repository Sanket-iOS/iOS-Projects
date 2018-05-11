//
//  paytaxViewController.h
//  IncomeTax
//
//  Created by tops on 4/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bankdrplist.h"


@interface paytaxViewController : UIViewController<NSXMLParserDelegate,NSURLConnectionDelegate>
{
    bankdrplist *drplist;
    NSArray *arrbank;
    NSURLConnection *currentConnection;
    NSMutableData *apiReturnXMLData;

}
@property (weak, nonatomic) IBOutlet UIButton *btndrpbank;
@property (weak, nonatomic) IBOutlet UILabel *lblbank;
@property(retain,nonatomic)NSString *stranount;
- (IBAction)selectbtndrp:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtacno;
- (IBAction)btnpayment:(id)sender;


@end
