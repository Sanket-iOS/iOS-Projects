//
//  CheckReturnStatus.h
//  IncomeTax
//
//  Created by tops on 3/27/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckReturnStatus : UIViewController<NSXMLParserDelegate>
{
    NSMutableData *datamute;


}
@property(retain,nonatomic)NSString *str;
- (IBAction)btnrtstatus:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtpan;
@property (weak, nonatomic) IBOutlet UITextField *txtpanyear;

@end
