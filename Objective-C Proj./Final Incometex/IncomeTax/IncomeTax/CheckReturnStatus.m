//
//  CheckReturnStatus.m
//  IncomeTax
//
//  Created by tops on 3/27/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "CheckReturnStatus.h"

@interface CheckReturnStatus ()

@end

@implementation CheckReturnStatus
@synthesize str,txtpanyear,txtpan;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnrtstatus:(id)sender {
    NSString *soapstring=[[NSString alloc]initWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body> <calculate xmlns=\"http://tempuri.org/\"><year>%@</year><pn>%@</pn></calculate></soap:Body></soap:Envelope>",txtpanyear.text,txtpan.text];
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://incometax.somee.com/webservice.asmx?op=calculate"];
    
    NSString *getlength=[[NSString alloc]initWithFormat:@"%i",soapstring.length];
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:url];
    [req setValue:@"incometax.somee.com" forHTTPHeaderField:@"Host"];
    [req setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req setValue:getlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"http://tempuri.org/calculate" forHTTPHeaderField:@"SOAPAction"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapstring dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *connect=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(connect)
    {
        datamute=[[NSMutableData alloc]init];
    }
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
    {
    }
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    {
        if ([elementName isEqualToString:@"calculateResponse"]) {
           /* if ([str isEqualToString:@""]) {
                UIAlertView *alrt =[[UIAlertView alloc]initWithTitle:@"Message" message:@"ITV Not Received" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
                [alrt show];

            }
            
           else
           {*/
            
            UIAlertView *alrt =[[UIAlertView alloc]initWithTitle:@"Message" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [alrt show];
           //}
        }
}
- (void)parserDidStartDocument:(NSXMLParser *)parser
    {
    
    }
    
    
- (void)parserDidEndDocument:(NSXMLParser *)parser
    {
        
    }
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    str=[[NSString alloc]initWithString:string];
    if ([str isEqualToString:@"PAN does not exist."]) {
        //NSLog(@"not pan card");
        UIAlertView *alrt1=[[UIAlertView alloc]initWithTitle:@"Status" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt1 show];
    }
    else if ([str isEqualToString:@"No e-Return has been filed for this PAN and Assessment Year."])
    {
        UIAlertView *alrt1=[[UIAlertView alloc]initWithTitle:@"Status" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt1 show];
        
    }
    
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    datamute.length=0;
    //NSLog(@"%i",datamute.length);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [datamute appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:datamute];
    parser.delegate=self;
    parser.shouldResolveExternalEntities=YES;
    [parser parse];
}
@end
