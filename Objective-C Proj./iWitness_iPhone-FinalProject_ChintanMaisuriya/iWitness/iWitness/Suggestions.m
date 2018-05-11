//
//  Suggestions.m
//  iWitness
//
//  Created by MACOS on 6/28/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "Suggestions.h"


@interface Suggestions ()

@end

@implementation Suggestions
@synthesize txtfSetPS,txtfSuggetionSubject,txtviewSuggetions,blurView,viewPS,sublbl,pickPS,btnCancel,btnSelect;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.temp.frame=CGRectMake(71, 500, 178, 134);
    
    _viewSuggestions.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewSuggestions.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewSuggestions.layer.shadowOffset=CGSizeMake(0,0);
    _viewSuggestions.layer.shadowOpacity=0.5;
    _viewSuggestions.layer.shadowRadius=2.0;
    _viewSuggestions.layer.cornerRadius=5;
    
    txtfSetPS.enabled=NO;
    txtviewSuggetions.layer.borderWidth=0.2;
    txtviewSuggetions.layer.borderColor=[[UIColor grayColor]CGColor];
    txtviewSuggetions.layer.cornerRadius=10;
    [txtviewSuggetions setDelegate:self];
    
    blurView.hidden=YES;
     viewPS.hidden=YES;
    [viewPS addSubview:sublbl];
    [viewPS addSubview:pickPS];
    [viewPS addSubview:btnCancel];
    [viewPS addSubview:btnSelect];
    
    
   // [viewPS setFrame:CGRectMake(self.viewPS.frame.origin.x, 500, self.viewPS.frame.size.width, self.viewPS.frame.size.height)];

    getPSName = [[NSMutableArray alloc]init];
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    
    NSString *strGetPSs = [NSString stringWithFormat:@"http://localhost/iWitness_WS/getallPS.php?all"];
    NSURL *psURL = [NSURL URLWithString:strGetPSs];
    NSURLRequest *psREQ = [NSURLRequest requestWithURL:psURL];
    
    NSURLSession *getPSSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getPSSTask = [getPSSession dataTaskWithRequest:psREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    
        getPSDetails = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            getPSName = [getPSDetails valueForKey:@"psName"];
            
            pickPS.dataSource=self;
            pickPS.delegate=self;
        });    
    }];
    [getPSSTask resume];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return getPSName.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [getPSName objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    strGetPSName = [[NSString alloc]initWithString:[getPSName objectAtIndex:row]];
    strGetPSID = [[getPSDetails objectAtIndex:row] valueForKey:@"psID"];
}

- (IBAction)imgSelectPS:(id)sender {
    
    [self.view endEditing:YES];
    viewPS.frame=CGRectMake(self.viewPS.frame.origin.x, self.view.frame.size.height, self.viewPS.frame.size.width, self.viewPS.frame.size.height);
    
    [UIView animateWithDuration:0.3 animations:^{
        blurView.hidden=NO;
        viewPS.hidden=NO;
        viewPS.frame=CGRectMake(self.viewPS.frame.origin.x, 150, self.viewPS.frame.size.width, self.viewPS.frame.size.height);
    } completion:NULL];
}

- (IBAction)btnSelect:(id)sender {
    
    txtfSetPS.text=strGetPSName;
    [UIView animateWithDuration:0.4 animations:^{
        viewPS.frame=CGRectMake(self.viewPS.frame.origin.x, self.viewPS.frame.origin.y+500, self.viewPS.frame.size.width, self.viewPS.frame.size.height);
    } completion:^(BOOL finished) {
        blurView.hidden=YES;
    }];
}

- (IBAction)btnCancel:(id)sender {
    
    [UIView animateWithDuration:0.4 animations:^{
        viewPS.frame=CGRectMake(self.viewPS.frame.origin.x, self.viewPS.frame.origin.y+500, self.viewPS.frame.size.width, self.viewPS.frame.size.height);
    } completion:^(BOOL finished) {
        blurView.hidden=YES;
    }];
}

- (IBAction)btnSendSuggestion:(id)sender {
    
    //NSString *a = txtfSuggetionSubject.text;
    
    if (![txtfSetPS.text isEqual:[NSNull null]] && ![txtfSuggetionSubject.text isEqual:[NSNull null]] && ![txtviewSuggetions.text isEqual:[NSNull null]]) {
        
        NSString *str = [NSString stringWithFormat:@"http://localhost/iWitness_WS/suggestion.php?userID=%@&policeSID=%@&sugSubject=%@&sugDetail=%@",strGetUID,strGetPSID,txtfSuggetionSubject.text,txtviewSuggetions.text];
        
        //NSString *str=[sendSuggestionStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *sendSuggestionStr=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]; //to remove extra space from URL.
        
        NSURL *sugURL = [NSURL URLWithString:sendSuggestionStr];
        NSURLRequest *sugREQ = [NSURLRequest requestWithURL:sugURL];
        
        NSURLSession *sugSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *sugSDTask = [sugSession dataTaskWithRequest:sugREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            checkStatus = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            
            if ([checkStatus isEqualToString:@"success\n"])
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You" message:@"Your suggestions are more valuable to us" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    txtfSetPS.text=nil;
                    txtfSuggetionSubject.text=nil;
                    txtviewSuggetions.text=nil;
                }];
                
                [alert addAction:Ok];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self presentViewController:alert animated:YES completion:nil];
                });
                
            }else{
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Your suggestion has not been sent. Please try again later." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
                
                [alert addAction:Ok];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self presentViewController:alert animated:YES completion:nil];
                });
            }
            
        }];
        [sugSDTask resume];
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Please do provide the necessary information" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        
        [alert addAction:Ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([txtviewSuggetions.text length] > 0) {
        [self.lblPlaceHolderText setHidden:YES];
    } else {
        [self.lblPlaceHolderText setHidden:NO];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
