//
//  Complaint.m
//  iWitness
//
//  Created by MACOS on 7/26/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "Complaint.h"
#import <AFURLSessionManager.h>
#import <AFHTTPSessionManager.h>

@interface Complaint ()
{
    int checkImages;
    double tmplat,tmplng;
    NSTimer *sentCompTimer;
    UIVisualEffectView *blur;
    UIActivityIndicatorView *actView;
}
@end

@implementation Complaint
@synthesize txtSetCT,txtViewComplaint,viewInitial,imgScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    flag=NO;
    checkPS=YES;
    checkImages=0;
    setIMGs = [[NSMutableArray alloc] init];
    setImg = [[NSArray alloc]init];
    strFinalPathIMGs=[[NSMutableString alloc]init];
    distancedt=[[NSMutableArray alloc]init];
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    
    
    _detailView.layer.borderWidth=0.2;
    _detailView.layer.borderColor=[[UIColor grayColor]CGColor];
    _detailView.layer.cornerRadius=10;
    
    locationManager = [[CLLocationManager alloc]init];
    geoCoder = [[CLGeocoder alloc]init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager requestAlwaysAuthorization];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    _lblTime.text=currentTime;
    
    dateFormatter.dateFormat=@"HH:mm:ss";
    time=[dateFormatter stringFromDate:today];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"d/M/yyyy";
    NSString *sdate = [formatter stringFromDate:[NSDate date]];
    _lblDate.text=sdate;
    
    formatter.dateFormat=@"yyyy-M-d";
    date=[formatter stringFromDate:[NSDate date]];

    
    txtSetCT.enabled=NO;
    txtSetCT.text=nil;
    txtViewComplaint.text=nil;
    
    _cmplntImg1.hidden=YES;
    _cmplntImg2.hidden=YES;
    _cmplntImg3.hidden=YES;
    _cmplntImg4.hidden=YES;
    viewInitial.hidden=NO;
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
    
    txtViewComplaint.layer.borderWidth=0.2;
    txtViewComplaint.layer.borderColor=[[UIColor grayColor]CGColor];
    txtViewComplaint.layer.cornerRadius=10;
    [txtViewComplaint setDelegate:self];
    
//    viewInitial.layer.borderWidth=0.2;
//    viewInitial.layer.borderColor=[[UIColor grayColor]CGColor];
//    viewInitial.layer.cornerRadius=10;
    
    imgScrollView.clipsToBounds=YES;
    imgScrollView.layer.borderWidth=0.2;
    imgScrollView.layer.borderColor=[[UIColor darkGrayColor]CGColor];
    imgScrollView.layer.cornerRadius=10;
    imgScrollView.showsVerticalScrollIndicator=NO;
    imgScrollView.contentSize=CGSizeMake(self.view.frame.size.width-60, self.view.frame.size.height-400);
    [imgScrollView addSubview:_cmplntImg1];
    [imgScrollView addSubview:_cmplntImg2];
    [imgScrollView addSubview:_cmplntImg3];
    [imgScrollView addSubview:_cmplntImg4];
    
    getCrimeTypesID = [[NSMutableArray alloc]init];
    getCrimeTypes = [[NSMutableArray alloc]init];
    
    NSString *strGetCT = [NSString stringWithFormat:@"http://localhost/iWitness_WS/crimeTypes.php?all"];
    NSURL *urlGetCT = [NSURL URLWithString:strGetCT];
    NSURLRequest *getCTREQ = [NSURLRequest requestWithURL:urlGetCT];
    
    NSURLSession *getCTSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getCTSDTask = [getCTSession dataTaskWithRequest:getCTREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        getData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        getCrimeTypesID = [getData valueForKey:@"ctID"];
        getCrimeTypes = [getData valueForKey:@"ctName"];
    }];
    [getCTSDTask resume];
}

- (IBAction)imgSelectCT:(id)sender {
    txtSetCT.text=nil;
    UIAlertController *ctAlt = [UIAlertController alertControllerWithTitle:@"Please select respective crime type:" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i=0; i<getCrimeTypes.count; i++) {
            [ctAlt addAction:[UIAlertAction actionWithTitle:[getCrimeTypes objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                txtSetCT.text=[getCrimeTypes objectAtIndex:i];
                getCTID = [getCrimeTypesID objectAtIndex:i];
            } ] ];
    }
    
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [ctAlt addAction:Cancel];
    [self presentViewController:ctAlt animated:YES completion:nil];
}

- (IBAction)btnAddImg:(id)sender {
   
    if (flag==NO) {
        pickCImg = [QBImagePickerController new];
        pickCImg.delegate=self;
        pickCImg.allowsMultipleSelection=YES;
        pickCImg.maximumNumberOfSelection=4;
        pickCImg.showsNumberOfSelectedAssets=YES;
        
        [self presentViewController:pickCImg animated:YES completion:NULL];
        flag=YES;
    }else{
        
        UIAlertController *alt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"Do you really wants clear the selection and make another selection of images" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *altYes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            setImg = [[NSArray alloc]init];
            _cmplntImg1.image=Nil;
            _cmplntImg2.image=Nil;
            _cmplntImg3.image=Nil;
            _cmplntImg4.image=Nil;
            
            [self presentViewController:pickCImg animated:YES completion:NULL];
            //flag=NO;
        }];
        UIAlertAction *altNo = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:Nil];
        }];
        
        [alt addAction:altNo];
        [alt addAction:altYes];
        [self presentViewController:alt animated:YES completion:Nil];
    }
}

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets{
    
    setIMGs = [[NSMutableArray alloc]init];
    
    if ([assets count]!=4) {
        imgScrollView.scrollEnabled=NO;
    }else{
        imgScrollView.scrollEnabled=YES;
    }
    
    PHImageManager *imgManager = [PHImageManager new];
    for (int i=0; i<[assets count]; i++) {
        PHAsset *asset=[assets objectAtIndex:i];
        
        if (i==0) {
            [imgManager requestImageDataForAsset:asset options:0 resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                UIImage *image = [UIImage imageWithData:imageData];
                [setIMGs addObject:image];
                _cmplntImg1.image=image;
                _cmplntImg1.hidden=NO;
                _cmplntImg2.hidden=YES;
                _cmplntImg3.hidden=YES;
                _cmplntImg4.hidden=YES;
            }];
        }else if (i==1){
            [imgManager requestImageDataForAsset:asset options:0 resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                UIImage *image = [UIImage imageWithData:imageData];
                [setIMGs addObject:image];

                _cmplntImg2.image=image;
                _cmplntImg2.hidden=NO;
                _cmplntImg3.hidden=YES;
                _cmplntImg4.hidden=YES;
            }];
        }else if (i==2){
            [imgManager requestImageDataForAsset:asset options:0 resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                UIImage *image = [UIImage imageWithData:imageData];
                [setIMGs addObject:image];

                _cmplntImg3.image=image;
                _cmplntImg3.hidden=NO;
                _cmplntImg4.hidden=YES;
            }];
        }else if (i==3){
            [imgManager requestImageDataForAsset:asset options:0 resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                
                
                UIImage *image = [UIImage imageWithData:imageData];
                [setIMGs addObject:image];

                _cmplntImg4.image=image;
                _cmplntImg4.hidden=NO;
            }];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    viewInitial.hidden=YES;
    imgScrollView.hidden=NO;
}

- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController{
    [self dismissViewControllerAnimated:YES completion:NULL];
    flag = NO;
}

-(void)displayIMG{
    PagedImageScrollView *pageScrollView = [[PagedImageScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 365)];
    setImg=setIMGs;
    [pageScrollView setScrollViewContents:setImg];
    pageScrollView.pageControlPos = PageControlPositionCenterBottom;
    [self.view addSubview:pageScrollView];
}

- (IBAction)btnAddVideo:(id)sender {
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"This service will be available shortly" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    
    [alt addAction:actOK];
    [self presentViewController:alt animated:YES completion:NULL];
}

- (IBAction)btnAddAudio:(id)sender {
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"This service will be available shortly" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    
    [alt addAction:actOK];
    [self presentViewController:alt animated:YES completion:NULL];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertController *altError = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Failed to get your current location. Make sure your GPS is on." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    [altError addAction:actOK];
    [self presentViewController:altError animated:YES completion:NULL];
    
    // NSLog(@"Error: %@",error.description);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    currentLocation = newLocation;
    
    if (currentLocation != nil) {
//        NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]);
//        NSLog(@"%@",[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
    }
    
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error==Nil && [placemarks count]>0) {
            placemark = [placemarks lastObject];
            _lblCurrentLocation.text = [NSString stringWithFormat:@"%@, %@, %@, %@, %@ - %@",
                                        placemark.subThoroughfare, placemark.thoroughfare,
                                        placemark.locality, placemark.administrativeArea,
                                        placemark.country, placemark.postalCode];
        }else{
            _lblCurrentLocation.text = nil;
        }
    }];
    
    if (checkPS==YES) {
        [self getNearestPoliceStation];
        checkPS=NO;
    }
}

-(void)getNearestPoliceStation
{
    NSString *strGetPSs=[NSString stringWithFormat:@"http://localhost/iWitness_WS/nearestPS.php?all"];
    NSURL *psURL=[NSURL URLWithString:[strGetPSs stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *psREQ=[NSURLRequest requestWithURL:psURL];
    
    NSURLSession *getPSSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getPSSTask = [getPSSession dataTaskWithRequest:psREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        getNearestPS =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSMutableDictionary *tempDix in getNearestPS)
            {
                tmplat=[[tempDix valueForKey:@"psLatitude"]doubleValue];
                tmplng=[[tempDix valueForKey:@"psLongitude"]doubleValue];
                
                CLLocation *tmploc=[[CLLocation alloc]initWithLatitude:tmplat longitude:tmplng];
                CLLocationDistance dis=[currentLocation distanceFromLocation:tmploc];
                int pdis=dis/1000;
                NSString *distance=[NSString stringWithFormat:@"%d",pdis];
                NSString *policestname=[tempDix valueForKey:@"psName"];
                
                NSMutableDictionary *t1=[[NSMutableDictionary alloc]init];
                [t1 setObject:distance forKey:@"distance"];
                [t1 setObject:policestname forKey:@"pstation"];
                [t1 setObject:[tempDix valueForKey:@"psID"] forKey:@"policestid"];
                
                [distancedt addObject:t1];
            }
            
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"distance"  ascending:YES];
            distancedt=(NSMutableArray *)[distancedt sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
            
            NSMutableArray *final = [distancedt copy];
            
            NSString *tempStr1=[[final objectAtIndex:0]valueForKey:@"pstation"];
            NSString *setPS = [NSString stringWithFormat:@"%@ is nearest to you",tempStr1];
            _lblNearestPS.text=setPS;
            
            NSString *tempStr2=[[final objectAtIndex:0]valueForKey:@"distance"];
            NSString *disinkm=[NSString stringWithFormat:@"Distance between you and the nearest police station is %@ km.",tempStr2];
            _lblPSDistanceInfo.text=disinkm;
            
            strGetPSID=[[final objectAtIndex:0]valueForKey:@"policestid"];
        });
        
    }];
    [getPSSTask resume];
}

- (IBAction)sendComplaint:(id)sender {
     //sentCompTimer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showActivityView) userInfo:nil repeats:NO];
    [self showActivityView];
    [self sendComplaint];
}

-(void)sendComplaint{
    
    //self.navigationItem.hidesBackButton=YES;
    self.navigationController.navigationBarHidden=YES;

    NSString *getLattitude=[NSString stringWithFormat:@"%.20f",currentLocation.coordinate.latitude];
    NSString *getLongiting=[NSString stringWithFormat:@"%.20f",currentLocation.coordinate.longitude];
    NSString *compStatus=@"sent";
    
    
    NSURL *compURL=[NSURL URLWithString:@"http://localhost/iWitness_WS/getComplaint.php"];

    NSString *strComp=[[NSString alloc]initWithFormat:@"userID=%@&policeSID=%@&compty=%@&compDetail=%@&address=%@&lati=%@&lng=%@&compDate=%@&compTime=%@&compIMGs=%@&compStatus=%@",strGetUID,strGetPSID,getCTID,txtViewComplaint.text,_lblCurrentLocation.text,getLattitude,getLongiting,date,time,strFinalPathIMGs,compStatus];
    NSData *compData = [strComp dataUsingEncoding:NSUTF8StringEncoding];
    NSString *compDataLength = [NSString stringWithFormat:@"%lu", (unsigned long)compData.length];
    
    NSMutableURLRequest *compREQ = [[NSMutableURLRequest alloc] init];
    [compREQ setURL:compURL];
    [compREQ setHTTPMethod:@"POST"];
    [compREQ setValue:compDataLength forHTTPHeaderField:@"Content-Length"];
    [compREQ setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [compREQ setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [compREQ setHTTPBody:compData];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *compSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    NSURLSessionDataTask *uploadTask = [compSession dataTaskWithRequest:compREQ];
    [uploadTask resume];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
//    NSLog(@"Sent %lld, Total sent %lld, Not Sent %lld", bytesSent, totalBytesSent, totalBytesExpectedToSend);
//    NSLog(@"%lld",bytesSent/totalBytesSent);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    receiveData = [NSMutableData data];
    [receiveData setLength:0];
    completionHandler(NSURLSessionResponseAllow);
    //NSLog(@"NSURLSession Starts to Receive Data");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    [receiveData appendData:data];
    //NSLog(@"NSURLSession Receive Data");
    myString = [[NSString alloc] initWithData:receiveData encoding:NSUTF8StringEncoding];\
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    //NSLog(@"URL Session Complete: %@", task.response.description);
    
    if(error != nil) {
        NSLog(@"Error %@",[error userInfo]);
    } else {
        
        if ([myString isEqualToString:@"Success\n"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self stopActivityView];
                
                if (actView.isAnimating==NO) {
                    blur.hidden=YES;
                }
                
                if (blur.hidden) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hola!" message:@"Your complaint has been sent" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        blur.hidden=YES;
                        [self viewDidLoad];
                        self.navigationController.navigationBarHidden=NO;
                    }];
                    
                    [alert addAction:Ok];
                    [self presentViewController:alert animated:YES completion:nil];
                }
            });
        }
    }
}

-(void)showActivityView{
    
    blur = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 391, 504)];
    blur.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
    
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(67, 140, 180, 150)];
    aView.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
    //[aView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    aView.layer.shadowColor=[[UIColor blackColor]CGColor];
    aView.layer.shadowOffset=CGSizeMake(5,5);
    aView.layer.shadowOpacity=0.8;
    aView.layer.shadowRadius=2.0;
    //aView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:aView.bounds]CGPath];
    aView.layer.cornerRadius=9;
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 85, 260, 30)];
    [lbl setFont:[UIFont fontWithName:@"Savoye LET" size:25]];
    lbl.textColor = [UIColor whiteColor];
    lbl.text=@"Please wait for a while...";
    
    actView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    actView.frame = CGRectMake(75, 35, actView.bounds.size.width, actView.bounds.size.height);
    
    [aView addSubview:actView];
    [aView addSubview:lbl];
    [blur addSubview:aView];
    [self.view addSubview:blur];
    
    
    [actView startAnimating];
   
    [self uploadComplaintIMGs];
    
    actView.hidesWhenStopped=YES;
}

-(void)stopActivityView{
        //[actView performSelector:@selector(stopAnimating) withObject:nil afterDelay:2];
        [actView stopAnimating];
}

-(void)uploadComplaintIMGs{
    
    for (int i=0; i<[setIMGs count]; i++) {
        
        UIImage *tempImg = (UIImage *)[setIMGs objectAtIndex:i];
        
        int imgNumb =arc4random() % 9000 + 1000;
        NSString *imgName=[NSString stringWithFormat:@"C%d.jpg",imgNumb];
       
        strSetIMGs=[NSMutableString stringWithFormat:@"http://localhost/iWitness_WS/uploads/%@",imgName];
        [strFinalPathIMGs appendString:strSetIMGs];
        
        if ([setIMGs count]-1==i) {

        }else{
            [strFinalPathIMGs appendString:@","];
        }
        
        NSURL *URL = [NSURL URLWithString:@"http://localhost"];
        NSDictionary *parameters = @{@"username": @"csmaisuriya", @"password" : @"csm12345"};
        NSData *imageData = UIImageJPEGRepresentation(tempImg, 0.5);

        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:URL];
        [manager POST:@"/iWitness_WS/index.php" parameters:parameters constructingBodyWithBlock:^ void(id<AFMultipartFormData> formData){
            [formData appendPartWithFileData:imageData name:@"file" fileName:imgName mimeType:@"image/jpeg"];
        } success:^ void(NSURLSessionDataTask *operaton , id responseObject) {
            //NSLog(@"success%@",responseObject);
        } failure:^ void(NSURLSessionDataTask * opration, NSError * err) {
            NSLog(@"Error: %@", err);
        }];
    }
}


- (void)textViewDidChange:(UITextView *)textView{
    if ([txtViewComplaint.text length] > 0) {
        [self.lblPlaceHolderText setHidden:YES];
    } else {
        [self.lblPlaceHolderText setHidden:NO];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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


@end
