//
//  forgetpasswordViewController.m
//  Myproject
//
//  Created by tops on 1/16/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "forgetpasswordViewController.h"

@interface forgetpasswordViewController ()

@end

@implementation forgetpasswordViewController
@synthesize txtmsg,txtsub,txtto;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [maildata setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [maildata appendData:data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    currentConnection = nil;
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:maildata];
    parser.delegate=self;
    parser.shouldResolveExternalEntities=YES;
    [parser parse];
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"start:%@",elementName);
    elementnm=elementName;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([elementnm isEqualToString:@"SendMailResult"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:string delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"Connection Faile!!!");
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Connection Problem, Plz try again!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    [alert show];
    
    currentConnection = nil;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)btngo:(id)sender {
    [self.view endEditing:YES];
    
    NSString *soapstring=[[NSString alloc]initWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><SendMail xmlns=\"http://tempuri.org/\"><to>%@</to><sub>%@</sub><msg>%@</msg></SendMail></soap:Body></soap:Envelope>",txtto.text,txtsub.text,txtmsg.text];
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://sendmailapp.apphb.com/MyMailService.asmx?op=SendMail"];
    
    NSString *getlength=[[NSString alloc]initWithFormat:@"%lu",(unsigned long)soapstring.length];
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:url];
    [req setValue:@"sendmailapp.apphb.com" forHTTPHeaderField:@"Host"];
    [req setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req setValue:getlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"http://tempuri.org/SendMail" forHTTPHeaderField:@"SOAPAction"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapstring dataUsingEncoding:NSUTF8StringEncoding]];
    
    currentConnection=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(currentConnection)
    {
        maildata=[[NSMutableData alloc]init];
    }

/*UIAlertView * forgotPassword=[[UIAlertView alloc] initWithTitle:@"Forgot Password"      message:@"Please enter your email id" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    forgotPassword.alertViewStyle=UIAlertViewStylePlainTextInput;
    [forgotPassword textFieldAtIndex:0].delegate=self;
    [forgotPassword show];*/
        }
@end
