//
//  Validation.h
//  Expense
//
//  Created by mac on 4/5/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject
- (BOOL) validEmail:(NSString*) emailString;
- (BOOL)strongPassword:(NSString *)yourText;
-(void)ValidNumber:(NSString*)textfield;
-(void)ValidTime:(NSString*)TextField;
@property(strong,nonatomic)NSString *Validationmsg;
@end
