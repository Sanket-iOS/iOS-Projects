//
//  Validation.m
//  Expense
//
//  Created by mac on 4/5/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "Validation.h"


@implementation Validation
- (BOOL)strongPassword:(NSString *)yourText
{
    BOOL strongPwd = YES;
    
    //Checking length
    if([yourText length] < 5)
        strongPwd = NO;
    
    //Checking uppercase characters
    NSCharacterSet *charSet = [NSCharacterSet uppercaseLetterCharacterSet];
    NSRange range = [yourText rangeOfCharacterFromSet:charSet];
    if(range.location == NSNotFound)
        strongPwd = NO;
    
    
    
    //Checking lowercase characters
    charSet = [NSCharacterSet lowercaseLetterCharacterSet];
    range = [yourText rangeOfCharacterFromSet:charSet];
    if(range.location == NSNotFound)
        strongPwd = NO;
    
    //Checking special characters
    charSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    range = [yourText rangeOfCharacterFromSet:charSet];
    if(range.location == NSNotFound)
        strongPwd = NO;
    
    return strongPwd;
}
- (BOOL) validEmail:(NSString*) emailString {
    
    if([emailString length]==0){
        return NO;}
    
    
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    NSLog(@"%lu", (unsigned long)regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}
-(void)ValidNumber:(NSString*)textfield
{
   
    NSString *num = @"[0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", num];
    
    
    if([predicate evaluateWithObject:textfield])
    {
        self.Validationmsg=@"YES Matche";
        NSLog(@"%@",self.Validationmsg);
    }
    else
    {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"number Format is invalid" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [al show];
        self.Validationmsg=@"No Matche";
    }
}
-(void)ValidTime:(NSString*)TextField
{
    
     NSString *time=@"\\d{1,2}:\\d{1,2}\\s*(PM|AM)";
     NSPredicate *predicat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",time];
    if([predicat evaluateWithObject:TextField])
    {
        self.Validationmsg=@"YES Matche";
        NSLog(@"%@",self.Validationmsg);
    }
    else
    {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"Time Format is invalid" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [al show];
        self.Validationmsg=@"No Matche";
    }
}
@end
