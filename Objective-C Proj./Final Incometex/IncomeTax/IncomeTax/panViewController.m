//
//  panViewController.m
//  IncomeTax
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "panViewController.h"

@interface panViewController ()

@end

@implementation panViewController
@synthesize strpan;

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
    [self.view endEditing:YES];
    NSString *soapstring=[[NSString alloc]initWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><RetrivePanInfo xmlns=\"http://tempuri.org/\"><loginusernm>%@</loginusernm><loginpass>%@</loginpass><panno>%@</panno></RetrivePanInfo></soap:Body></soap:Envelope>",@"",@"",strpan];
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://ios8192014.somee.com/webservicepanno.asmx?op=RetrivePanInfo"];
    
    NSString *getlength=[[NSString alloc]initWithFormat:@"%lu",(unsigned long)soapstring.length];
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:url];
    [req setValue:@"ios8192014.somee.com" forHTTPHeaderField:@"Host"];
    [req setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req setValue:getlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"http://tempuri.org/RetrivePanInfo" forHTTPHeaderField:@"SOAPAction"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapstring dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *connect=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(connect)
    {
        datamute=[[NSMutableData alloc]init];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    datamute.length=0;
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
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"start:%@",elementName);
    elemntnm=elementName;
    if ([elementName isEqualToString:@"Table1"])
    {
        address=[[NSMutableString alloc]init];
        dob=[[NSMutableString alloc]init];
        ffullname=[[NSMutableString alloc]init];
        fullname=[[NSMutableString alloc]init];
        pan=[[NSMutableString alloc]init];
        dictmute=[[NSMutableDictionary alloc]init];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //NSLog(@"%@",string);
    if ([elemntnm isEqualToString:@"address"])
    {
        [address appendString:string];
    }
    if ([elemntnm isEqualToString:@"dob"])
    {
        [dob appendString:string];
    }
    if ([elemntnm isEqualToString:@"ffullname"])
    {
        [ffullname appendString:string];
    }
    if ([elemntnm isEqualToString:@"fullname"])
    {
        [fullname appendString:string];
    }
    if ([elemntnm isEqualToString:@"pan"])
    {
        [pan appendString:string];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Table1"])
    {
        [dictmute setObject:address forKey:@"address"];
        [dictmute setObject:dob forKey:@"dob"];
        [dictmute setObject:ffullname forKey:@"ffullname"];
        [dictmute setObject:fullname forKey:@"fullname"];
        [dictmute setObject:pan forKey:@"pan"];
        [arrmute addObject:[dictmute copy]];
    }
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    for (int i=0;i<arrmute.count;i++)
    {
        NSLog(@"Index:%d,Value:%@",i,[arrmute objectAtIndex:i]);
    }
    [self.tblview reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrmute.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:@"prototype" forIndexPath:indexPath];
    cel.textLabel.text=[[arrmute objectAtIndex:indexPath.row]objectForKey:@"fullname"];
    return cel;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"bridge"])
    {
        NSIndexPath *ind=[self.tblview indexPathForSelectedRow];
        NSMutableArray *arr2=[[NSMutableArray alloc]init];
        [arr2 addObject:[[arrmute objectAtIndex:ind.row]objectForKey:@"fullname"]];
        [arr2 addObject:[[arrmute objectAtIndex:ind.row]objectForKey:@"address"]];
        [arr2 addObject:[[arrmute objectAtIndex:ind.row]objectForKey:@"ffullname"]];
        [arr2 addObject:[[arrmute objectAtIndex:ind.row]objectForKey:@"dob"]];
        [arr2 addObject:[[arrmute objectAtIndex:ind.row]objectForKey:@"pan"]];
        UITableViewController *new=[segue destinationViewController];
        //new.arrget=arr2;
    }
}




@end
