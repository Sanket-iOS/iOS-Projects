//
//  MP_DetailView.m
//  iWitness
//
//  Created by MACOS on 6/22/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "MP_DetailView.h"

@interface MP_DetailView (){
    int flag;
    double tmplat,tmplng;
    NSString *checkStatus;
    NSString *curlati,*curlong,*mid;
}

@end

@implementation MP_DetailView
@synthesize lblMPName,lblMPAge,lblMPDetails,lblMissingDate,lblMPContact,dimgMP;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    flag=1;
    checkPS=NO;
    _blurViewLoading.layer.cornerRadius=15;
    _blurViewLoading.clipsToBounds=YES;
    _blurViewLoading.layer.masksToBounds=YES;
    _blurViewLoading.hidden=YES;
    
    geoCoder = [[CLGeocoder alloc]init];
    getMPDetails = [[NSArray alloc]init];
    distancedt=[[NSMutableArray alloc]init];


    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    getMPDetails = [uDef valueForKey:@"setDetails"];
    
    if([CLLocationManager locationServicesEnabled])
    {
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        _currentLocation = [[CLLocation alloc] initWithLatitude:appDelegate.currentLocation.coordinate.latitude longitude:appDelegate.currentLocation.coordinate.longitude];
        
        if (_currentLocation != nil) {
            curlong = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.longitude];
            curlati = [NSString stringWithFormat:@"%.8f", _currentLocation.coordinate.latitude];
            
            [geoCoder reverseGeocodeLocation:_currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                if (error==Nil && [placemarks count]>0) {
                    placemark = [placemarks lastObject];
                    getMPLocation = [NSString stringWithFormat:@"%@, %@, %@, %@, %@ - %@",
                                               placemark.subThoroughfare, placemark.thoroughfare,
                                               placemark.locality, placemark.administrativeArea,
                                               placemark.country, placemark.postalCode];
                    NSLog(@"%@",getMPLocation);
                }else{
                    //  _lblCurrentLocation.text = nil;
                }
            }];
            
            _lblactivityIndicator.text=@"Finding nearest Policestation";
            
            if (flag==1) {
                [self getNearestPoliceStation];
                flag=0;
                checkPS=YES;
            }
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatedLocation:) name:@"newLocationNotif" object:nil];
    
    
    //dimgMP.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[getMPDetails valueForKey:@"mpImage"]]]];
    mid=[getMPDetails valueForKey:@"mpID"];
    lblMPName.text = [getMPDetails valueForKey:@"mpName"];
    lblMPAge.text = [getMPDetails valueForKey:@"mpAge"];
    lblMPDetails.text = [getMPDetails valueForKey:@"mpDetails"];
    lblMissingDate.text = [getMPDetails valueForKey:@"missingDate"];
    lblMPContact.text = [getMPDetails valueForKey:@"mpContact"];
}

-(void) updatedLocation:(NSNotification*)notif {
    _currentLocation = (CLLocation*)[[notif userInfo] valueForKey:@"newLocationResult"];
}

-(void)getNearestPoliceStation
{
    NSString *strGetPSs=[NSString stringWithFormat:@"http://localhost/iWitness_WS/nearestPS.php?all"];
    NSURL *psURL=[NSURL URLWithString:[strGetPSs stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *psREQ=[NSURLRequest requestWithURL:psURL];
    
    NSURLSession *getPSSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *getPSSTask = [getPSSession dataTaskWithRequest:psREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        getNearestPS =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",[getNearestPS description]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSMutableDictionary *tempDix in getNearestPS)
            {
                tmplat=[[tempDix valueForKey:@"psLatitude"]doubleValue];
                tmplng=[[tempDix valueForKey:@"psLongitude"]doubleValue];
                
                CLLocation *tmploc=[[CLLocation alloc]initWithLatitude:tmplat longitude:tmplng];
                CLLocationDistance dis=[_currentLocation distanceFromLocation:tmploc];
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
            NSLog(@"%@",[final description]);
            
            NSString *tempStr1=[[final objectAtIndex:0]valueForKey:@"pstation"];
            NSString *setPS = [NSString stringWithFormat:@"%@",tempStr1];
            _lblnearPolicestation.text=setPS;
            
            NSString *tempStr2=[[final objectAtIndex:0]valueForKey:@"distance"];
            NSString *disinkm=[NSString stringWithFormat:@"Distance from you is %@ km.",tempStr2];
            _lblDistancefromYou.text=disinkm;
            
            strGetPSID=[[final objectAtIndex:0]valueForKey:@"policestid"];
            checkPS=YES;
        });
        
    }];
    [getPSSTask resume];
}

-(void)sendLocation{
    NSString *str = [NSString stringWithFormat:@"http://localhost/iWitness_WS/sendMPLocation.php?mpID=%@&uID=%@&psID=%@&lati=%@&lng=%@&flAddress=%@",mid,strGetUID,strGetPSID,curlati,curlong,getMPLocation];
    NSURL *url=[NSURL URLWithString:[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    NSURLRequest *urlREQ = [NSURLRequest requestWithURL:url];
    NSURLSession *cpSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *cpSDTask = [cpSession dataTaskWithRequest:urlREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        checkStatus = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if ([checkStatus isEqualToString:@"Success\n"]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hola!" message:@"Thank you for your support" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self dismissViewControllerAnimated:YES completion:nil];
                _viewMain.layer.backgroundColor=[[UIColor clearColor] CGColor];
                self.navigationController.navigationBarHidden=NO;
                _blurViewLoading.hidden=YES;
            }];
            [alert addAction:Ok];
            dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:alert animated:YES completion:nil];});
        }else{
            
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"There is a problem. Please try again later" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self dismissViewControllerAnimated:YES completion:nil];
                _viewMain.layer.backgroundColor=[[UIColor clearColor] CGColor];
                self.navigationController.navigationBarHidden=NO;
                _blurViewLoading.hidden=YES;
            }];
            [errorAlert addAction:Ok];
            dispatch_async(dispatch_get_main_queue(), ^{[self presentViewController:errorAlert animated:YES completion:nil];});
        }
    }];
    [cpSDTask resume];
}

- (IBAction)btnSendLocation:(id)sender {
    
    _btnSendLocation.enabled=false;
    _viewMain.layer.backgroundColor=[[UIColor grayColor]CGColor];
    self.navigationController.navigationBarHidden=YES;
    _blurViewLoading.hidden=NO;
    
    _blurViewLoading.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [UIView animateWithDuration:0.3/1.9 animations:^{
        _blurViewLoading.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _blurViewLoading.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _blurViewLoading.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    if (checkPS==NO) {
        [_activityindicatorloading startAnimating];
        _btnFinalSendLocation.enabled=false;
        _lblactivityIndicator.text=@"Fetching Your Current Location";
    }else{
        [_activityindicatorloading stopAnimating];
        [_activityindicatorloading removeFromSuperview];
        _lblactivityIndicator.text=@"Founded";
        _btnFinalSendLocation.enabled=true;
        checkPS=NO;
    }
}

- (IBAction)btnFinalSendLocation:(id)sender {
    
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"Do you really want to send?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        _viewMain.layer.backgroundColor=[[UIColor clearColor] CGColor];
        self.navigationController.navigationBarHidden=NO;
        _blurViewLoading.hidden=YES;
    }];
    UIAlertAction *Send = [UIAlertAction actionWithTitle:@"Send" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self sendLocation];
    }];
    
    [alt addAction:Cancel];
    [alt addAction:Send];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alt animated:YES completion:nil];
    });
    
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
