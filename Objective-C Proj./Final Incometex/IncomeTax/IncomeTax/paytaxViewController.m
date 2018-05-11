//
//  paytaxViewController.m
//  IncomeTax
//
//  Created by tops on 4/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "paytaxViewController.h"
#import "emailsending.h"

@interface paytaxViewController ()

@end

@implementation paytaxViewController
@synthesize btndrpbank,stranount;

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
    arrbank = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"SBI",@"BOB",@"HDFC",nil]];
    
    /*arrdata1 = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Resident",@"Non-Resident",@"Ordinaery",nil]];*/
	
	drplist = [[bankdrplist alloc] initWithArrayData:arrbank cellHeight:30 heightTableView:100 paddingTop:-8 paddingLeft:-5 paddingRight:100 refView:btndrpbank animation:BLENDIN2 openAnimationDuration:0 closeAnimationDuration:0];
	
	drplist.delegate = self;
	
	[self.view addSubview:drplist.view];
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
-(void)dropDownCellSelected2:(NSInteger)returnIndex
{
    self.lblbank.text=[arrbank objectAtIndex:returnIndex];

}
- (IBAction)btnpayment:(id)sender {
    
   // NSURL *url=[[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://www.topslearn.somee.com/api/values/getvalues?acno=%@&balance=%@",self.txtacno.text,stranount]];
    
    
    int ano=[self.txtacno.text intValue];
    int balnc=[stranount intValue];
    
    NSURL *url=[[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://www.topslearn.somee.com/api/values/getvalues?acno=%d&balance=%d",ano,balnc]];
    
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:url];
    
    // we will want to cancel any current connections
    if(currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        apiReturnXMLData = nil;
    }
    
    currentConnection = [[NSURLConnection alloc]initWithRequest:restRequest delegate:self];
    
    // If the connection was successful, create the XML that will be returned.
    
    apiReturnXMLData = [NSMutableData data];
    
    //Conform Email
    
    
    
}
- (IBAction)selectbtndrp:(id)sender {
    [drplist openAnimation];
    
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [apiReturnXMLData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [apiReturnXMLData appendData:data];
    // NSLog(@"%d",[apiReturnXMLData length]);
    
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    currentConnection = nil;
    NSString *st=[[NSString alloc]initWithData:apiReturnXMLData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",st);
    if ([st isEqualToString:@"Transaction Completed,,,"]) {
        emailsending *Objemail=[[emailsending alloc]init];
        [Objemail SendEmail];
    }
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:st delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alrt show]; }
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"URL Connection Failed!");
    currentConnection = nil;
    
}

@end
