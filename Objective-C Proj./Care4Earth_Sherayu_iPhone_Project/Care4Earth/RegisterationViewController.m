//
//  RegisterationViewController.m
//  Care4Earth
//
//  Created by tops on 2/10/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "RegisterationViewController.h"
#import "HomeViewController.h"
@interface RegisterationViewController ()

@end

@implementation RegisterationViewController
@synthesize tblstate,arrData,btn,i,tblCity,btn1,txtfullname,txtadd,txtcont,txtemailid,txtpass,txtcnfrpass,arrData1;

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
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"simple-green-powerpoint-template.jpg"]];
    arrData = [[NSMutableArray alloc] initWithObjects:@"Gujarat",@"Maharashtra",@"Rajasthan",nil];
     arrData1 = [[NSMutableArray alloc] initWithObjects:@"Ahmedabad",@"Baroda",nil];
    //tblSimpleTable.frame =CGRectMake(10, 10, 300, 100);
    flag=1;
    tblstate.hidden=YES;
    btn.layer.cornerRadius=8;
    tblstate.layer.cornerRadius=8;
   /* UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handleTapGesture:)];
    tap.numberOfTapsRequired=1;
    tap.cancelsTouchesInView=NO	;
    [self.view addGestureRecognizer:tap];*/
    
    flag1=1;
    tblCity.hidden=YES;
    btn1.layer.cornerRadius=8;
    tblCity.layer.cornerRadius=8;
   /* UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handleTapGesture1:)];
    tap1.numberOfTapsRequired=1;
    tap1.cancelsTouchesInView=NO	;
    [self.view addGestureRecognizer:tap1];*/
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    if(self.tblstate)
    {
    
    CGPoint location = [tapGesture locationInView:self.tblstate];
    if([tblstate indexPathForRowAtPoint:location] && [tblstate alpha] != 0) {
        // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
    } else {
        // Inside
    }
        flag=1;
        tblstate.hidden=YES;
        i.hidden=NO;
    
    }
    else
    {
        
        CGPoint location = [tapGesture locationInView:self.tblCity];
        if([tblCity indexPathForRowAtPoint:location] && [tblCity alpha] != 0) {
            // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
        } else {
            // Inside
        }
            flag1=1;
            tblCity.hidden=YES;
            i.hidden=NO;
        

    }
}
- (void)handleTapGesture1:(UITapGestureRecognizer *)tapGesture1
{
    CGPoint location = [tapGesture1 locationInView:self.tblCity];
    if([tblCity indexPathForRowAtPoint:location] && [tblCity alpha] != 0) {
       
    } else {
        // Inside
    }
        flag1=1;
        tblCity.hidden=YES;
        i.hidden=NO;
    
}
- (IBAction)btnCity:(id)sender {
    if (flag1==1) {
        flag1=0;
        tblCity.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag1=1;
        tblCity.hidden=YES;
        i.hidden=NO;
    }
    

}
/*-(void)dismissKeyboard {
    CGPoint location = [ locationInView:self.tableView];
    if([tableView indexPathForRowAtPoint:location] && [tableView alpha] != 0) {
        // Do nothing, tap handled by the UITableView delegate method or the custom background uiview
    } else {
        // Inside
        [self toggleGUI:nil];
    }
    flag=1;
    tblstate.hidden=YES;
    i.hidden=NO;
}*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == tblstate)
    {
    return [arrData count];
    }
    else{
        return [arrData1 count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    if(tableView == tblstate)
    {
        cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    }
    else{
         cell.textLabel.text = [arrData1 objectAtIndex:indexPath.row];
    }

   
    
    return cell;
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == tblstate)
    {
    return 1;
    }
    else
    {
        return 1;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewController *reg =[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:reg animated:YES];
}

- (IBAction)btnRegister:(id)sender
{
    
    
    if([txtpass.text isEqualToString:txtcnfrpass.text])
    {
        BOOL check;
        check=[self validateEmail:txtemailid.text];
        
        if (check==TRUE) {
            
            BOOL checkphone;
            checkphone=[self validatePhone:txtcont.text];
            if(checkphone==TRUE)
            {
                
                
                
                NSString *Str=[[NSString alloc]initWithFormat:@"http://carefourearth.somee.com/api/login/postuserdetail/?name=%@&address=%@&phoneno=%@&email=%@&password=%@&cityid=1&stateid=1", txtfullname.text, txtadd.text, txtcont.text, txtemailid.text, txtpass.text];
                
                
                
                NSURL *Url=[[NSURL alloc]initWithString:Str];
                NSURLRequest *req=[[NSURLRequest alloc]initWithURL:Url];
                NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
                
                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Registration" message:@"Registered Successfully!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alrt show];
                } else {
                    UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"alert" message:@"Please insert required data" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                    [alr show];
                    
                }
            }
            else
            {
                UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"alert" message:@"Phone Number is incorrect" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alr show];
            }
        }
        else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Email is invalid" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
        }
    
   
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Password and Confirm Password donot match!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alt show];
    
    
    

              
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSLog(@"%@",[response description]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *st=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    NSString *s = [NSString stringWithFormat:@"\"Registered Sucessfully\""];
    
    NSLog(@"%@",s);
    NSLog(@"%@",st);
    
    if ([st isEqualToString:s]=="")
    {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Registration" message:@"Record not inserted!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
    }
    txtfullname.text=@"";
    txtadd.text=@"";
    txtcont.text=@"";
    txtemailid.text=@"";
    txtpass.text=@"";
    txtcnfrpass.text=@"";
    


}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txtcnfrpass resignFirstResponder];
    return YES;
}
-(BOOL)validatePhone:(NSString *)inputText{
    NSString *phoneNumber=txtcont.text;
    NSString *phoneRegx=@"^([7-9]{1}[0-9]{9})$";
    NSPredicate *test=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegx];
    BOOL 	matches=[test evaluateWithObject:phoneNumber];
    return matches;
}
- (BOOL)validateEmail:(NSString *)inputText {
    NSString *emailRegex = @"[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSRange aRange;
    if([emailTest evaluateWithObject:inputText]) {
        aRange = [inputText rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [inputText length])];
        int indexOfDot = aRange.location;
        //NSLog(@"aRange.location:%d - %d",aRange.location, indexOfDot);
        if(aRange.location != NSNotFound) {
            NSString *topLevelDomain = [inputText substringFromIndex:indexOfDot];
            topLevelDomain = [topLevelDomain lowercaseString];
            //NSLog(@"topleveldomains:%@",topLevelDomain);
            NSSet *TLD;
            TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
            if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain])) {
                //NSLog(@"TLD contains topLevelDomain:%@",topLevelDomain);
                return TRUE;
            }
            /*else {
             NSLog(@"TLD DOEST NOT contains topLevelDomain:%@",topLevelDomain);
             }*/
            
        }
    }
    return FALSE;
}


- (IBAction)btnselect:(id)sender {
    if (flag==1) {
        flag=0;
        tblstate.hidden=NO;
        i.hidden=YES;
    }
    else{
        flag=1;
        tblstate.hidden=YES;
        i.hidden=NO;
    }
    

}

@end
