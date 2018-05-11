//
//  ComplaintStatusDetail.m
//  iWitness
//
//  Created by MACOS on 8/30/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "ComplaintStatusDetail.h"
#import "PoliceOfficailDetail.h"

@interface ComplaintStatusDetail (){
    UIVisualEffectView *blur;
}

@end

@implementation ComplaintStatusDetail
@synthesize csDetailScroll,imgScrollView,lblComplaintNo,lblDate,lblPoliceStation,lblAssigned,lblComplaintDate,lblComplaintTime,lblSentLocation,lblCrimeType,lblComplaintDetails,imgPO;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    csDetailScroll.scrollEnabled=YES;
    csDetailScroll.showsHorizontalScrollIndicator=NO;
    csDetailScroll.contentSize=CGSizeMake(300, 525);
    
    getPSName = [[NSArray alloc]init];
    getPOName = [[NSArray alloc]init];
    getCSDetails = [[NSArray alloc]init];
    getCIMGs = [[NSArray alloc]init];
    
    setPOInfo = [[NSMutableArray alloc]init];
    
    setIMGs = [[NSMutableArray alloc] init];
    setImg = [[NSArray alloc]init];
    
    _btnPOInfo.hidden=YES;
    
    NSUserDefaults *csdDef=[NSUserDefaults standardUserDefaults];
    getCSDetails = [csdDef valueForKey:@"setDetails"];
    
    lblComplaintNo.text = [getCSDetails valueForKey:@"cID"];
    
    NSString *date=[getCSDetails valueForKey:@"cDate"];
    NSDateFormatter *df1=[[NSDateFormatter alloc]init];
    [df1 setDateFormat:@"yyyy/MM/dd"];
    NSDate *Date=[df1 dateFromString:date];
    [df1 setDateFormat:@"dd/MM/yyyy"];
    NSString *compDate=[df1 stringFromDate:Date];
    
    NSString *time=[getCSDetails valueForKey:@"cTime"];
    NSDateFormatter *df2=[[NSDateFormatter alloc]init];
    [df2 setDateFormat:@"HH:mm:ss"];
    NSDate *Time=[df2 dateFromString:time];
    [df2 setDateFormat:@"hh:mm a"];
    NSString *compTime=[df2 stringFromDate:Time];
    
    lblDate.text = compDate;
    lblComplaintDate.text = compDate;
    lblComplaintTime.text = compTime;
    
    _cmplntImg1.hidden=YES;
    _cmplntImg2.hidden=YES;
    _cmplntImg3.hidden=YES;
    _cmplntImg4.hidden=YES;
    imgScrollView.hidden=YES;
    
    _cmplntImg1.clipsToBounds=YES;
    _cmplntImg1.layer.borderWidth=0.5;
    _cmplntImg1.layer.borderColor=[[UIColor lightTextColor]CGColor];
    _cmplntImg1.layer.cornerRadius=10;
    
    _cmplntImg2.clipsToBounds=YES;
    _cmplntImg2.layer.borderWidth=0.5;
    _cmplntImg2.layer.borderColor=[[UIColor lightTextColor]CGColor];
    _cmplntImg2.layer.cornerRadius=10;
    
    _cmplntImg3.clipsToBounds=YES;
    _cmplntImg3.layer.borderWidth=0.5;
    _cmplntImg3.layer.borderColor=[[UIColor lightTextColor]CGColor];
    _cmplntImg3.layer.cornerRadius=10;
    
    _cmplntImg4.clipsToBounds=YES;
    _cmplntImg4.layer.borderWidth=0.5;
    _cmplntImg4.layer.borderColor=[[UIColor lightTextColor]CGColor];
    _cmplntImg4.layer.cornerRadius=10;
    
    imgScrollView.clipsToBounds=YES;
    imgScrollView.layer.borderWidth=0.2;
    imgScrollView.layer.borderColor=[[UIColor darkGrayColor]CGColor];
    imgScrollView.layer.cornerRadius=10;
    imgScrollView.showsVerticalScrollIndicator=NO;
    imgScrollView.contentSize=CGSizeMake(self.view.frame.size.width-20, self.view.frame.size.height-400);
    [csDetailScroll addSubview:imgScrollView];
    [imgScrollView addSubview:_cmplntImg1];
    [imgScrollView addSubview:_cmplntImg2];
    [imgScrollView addSubview:_cmplntImg3];
    [imgScrollView addSubview:_cmplntImg4];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayIMG)];
    tap.numberOfTapsRequired=1;
    _cmplntImg1.userInteractionEnabled=YES;
    [_cmplntImg1 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayIMG)];
    tap.numberOfTapsRequired=1;
    _cmplntImg2.userInteractionEnabled=YES;
    [_cmplntImg2 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayIMG)];
    tap.numberOfTapsRequired=1;
    _cmplntImg3.userInteractionEnabled=YES;
    [_cmplntImg3 addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(displayIMG)];
    tap.numberOfTapsRequired=1;
    _cmplntImg4.userInteractionEnabled=YES;
    [_cmplntImg4 addGestureRecognizer:tap3];
    
    
    NSString *tempPSName= [getCSDetails valueForKey:@"psID"];
    NSURL *psURL=[NSURL URLWithString:@"http://localhost/iWitness_WS/getPoliceSTName.php"];
    NSString *strPS=[[NSString alloc]initWithFormat:@"pSTID=%@",tempPSName];
    NSData *psData = [strPS dataUsingEncoding:NSUTF8StringEncoding];
    NSString *psDataLength = [NSString stringWithFormat:@"%lu", (unsigned long)psData.length];

    NSMutableURLRequest *psREQ = [[NSMutableURLRequest alloc] init];
    [psREQ setURL:psURL];
    [psREQ setHTTPMethod:@"POST"];
    [psREQ setValue:psDataLength forHTTPHeaderField:@"Content-Length"];
    [psREQ setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [psREQ setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [psREQ setHTTPBody:psData];
    
    NSError *error = nil;
    NSURLSession *compSession = [NSURLSession sharedSession];
    if (!error)
    {
        NSURLSessionDataTask *getPSSTask=[compSession dataTaskWithRequest:psREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            getPSName = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            {
                lblPoliceStation.text = [[getPSName objectAtIndex:0]valueForKey:@"psName"];
            }
        }];
        [getPSSTask resume];
    }
    
    NSString *tempPOID = [getCSDetails valueForKey:@"poID"];
    if (![tempPOID isEqualToString:@"0"])
    {
        NSURL *poURL=[NSURL URLWithString:@"http://localhost/iWitness_WS/admin/getPODetails.php"];
        NSString *strPO=[[NSString alloc]initWithFormat:@"poID=%@",tempPOID];
        NSData *poData = [strPO dataUsingEncoding:NSUTF8StringEncoding];
        NSString *poDataLength = [NSString stringWithFormat:@"%lu", (unsigned long)poData.length];
        
        NSMutableURLRequest *poREQ = [[NSMutableURLRequest alloc] init];
        [poREQ setURL:poURL];
        [poREQ setHTTPMethod:@"POST"];
        [poREQ setValue:poDataLength forHTTPHeaderField:@"Content-Length"];
        [poREQ setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [poREQ setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [poREQ setHTTPBody:poData];
        
        NSError *error = nil;
        NSURLSession *compSession = [NSURLSession sharedSession];
        if (!error)
        {
            NSURLSessionDataTask *getPSSTask=[compSession dataTaskWithRequest:poREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                getPOName = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                {
                    if ([getPOName count]>0) {
                        
                        dispatch_async(dispatch_get_main_queue(),^{
                            
                            _btnPOInfo.hidden=NO;
                            
                            lblAssigned.text = [[getPOName objectAtIndex:0]valueForKey:@"poName"];
                            
                            NSString *tempPOName = [[getPOName objectAtIndex:0]valueForKey:@"poName"];
                            NSString *tempPOPost = [[getPOName objectAtIndex:0]valueForKey:@"poPost"];
                            NSString *tempPOContact = [[getPOName objectAtIndex:0]valueForKey:@"poContact"];
                            NSString *tempPOImg = [[getPOName objectAtIndex:0]valueForKey:@"poImage"];
                            
                            [setPOInfo addObject:tempPOName];
                            [setPOInfo addObject:tempPOPost];
                            [setPOInfo addObject:tempPOContact];
                            [setPOInfo addObject:tempPOImg];
                            });
                    }
                }
            }];
            [getPSSTask resume];
        }
    }else{
        lblAssigned.text = [NSString stringWithFormat:@"Your complaint is not assigned yet"];
    }
    
    lblCrimeType.text = [getCSDetails valueForKey:@"ctName"];
    lblComplaintDetails.text = [getCSDetails valueForKey:@"cDetails"];
    lblSentLocation.text = [getCSDetails valueForKey:@"locationAddress"];
    
    NSString *temIMGs = [getCSDetails valueForKey:@"cIMG_URLs"];
    getCIMGs = [temIMGs componentsSeparatedByString:@","];
    
    for (int i=0; i<[getCIMGs count]; i++) {
        if (i==0) {
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getCIMGs objectAtIndex:0]]]];
                [setIMGs addObject:image];
            
                _cmplntImg1.image=image;
                _cmplntImg1.hidden=NO;
                _cmplntImg2.hidden=YES;
                _cmplntImg3.hidden=YES;
                _cmplntImg4.hidden=YES;
            
                imgScrollView.hidden=NO;
                imgScrollView.scrollEnabled=NO;
        }else if (i==1){
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getCIMGs objectAtIndex:1]]]];
                [setIMGs addObject:image];
                
                _cmplntImg2.image=image;
                _cmplntImg2.hidden=NO;
                _cmplntImg3.hidden=YES;
                _cmplntImg4.hidden=YES;
            
                imgScrollView.hidden=NO;
                imgScrollView.scrollEnabled=NO;
        }else if (i==2){
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getCIMGs objectAtIndex:2]]]];
                [setIMGs addObject:image];
                
                _cmplntImg3.image=image;
                _cmplntImg3.hidden=NO;
                _cmplntImg4.hidden=YES;
            
                imgScrollView.hidden=NO;
                imgScrollView.scrollEnabled=YES;
        }else if (i==3){
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getCIMGs objectAtIndex:3]]]];
                [setIMGs addObject:image];
                
                _cmplntImg4.image=image;
                _cmplntImg4.hidden=NO;
            
                imgScrollView.hidden=NO;
                imgScrollView.scrollEnabled=YES;
        }

    }
}

-(void)displayIMG{
    PagedImageScrollView *pageScrollView = [[PagedImageScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 365)];
    setImg=setIMGs;
    [pageScrollView setScrollViewContents:setImg];
    pageScrollView.pageControlPos = PageControlPositionCenterBottom;
    [self.view addSubview:pageScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPOInfo:(id)sender {
    NSUserDefaults *poDef = [NSUserDefaults standardUserDefaults];
    [poDef setObject:setPOInfo forKey:@"poDetails"];
    
    PoliceOfficailDetail *pod = [self.storyboard instantiateViewControllerWithIdentifier:@"PoliceOfficailDetail_SB"];
    [self.navigationController pushViewController:pod animated:YES];
}

@end
