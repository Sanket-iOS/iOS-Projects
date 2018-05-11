//
//  mapviewcontroller.m
//  Street_Food
//
//  Created by Tops on 10/2/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "mapviewcontroller.h"

@interface mapviewcontroller ()

@end

@implementation mapviewcontroller
@synthesize map_kit_view,blur_view,txt_search;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    
    
    blur_view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    blur_view.clipsToBounds = YES;
    blur_view.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    blur_view.layer.borderWidth = 1.0;
    blur_view.layer.cornerRadius = 6.0;
    
    
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.distanceFilter = kCLDistanceFilterNone;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [manager requestWhenInUseAuthorization];
    
    [manager startUpdatingLocation];
    [manager requestWhenInUseAuthorization];
    [manager requestLocation];
    if ((![CLLocationManager locationServicesEnabled])
        || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)
        || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied))
    {
        // Send the user to the location settings preferences
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"prefs:root=LOCATION_SERVICES"]];
    }
    [map_kit_view setDelegate:(id<MKMapViewDelegate>)self];
    [map_kit_view setShowsUserLocation:YES];



    // Do any additional setup after loading the view.
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error");
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
}

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *AnnotationViewID = @"annotationViewID";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[map_kit_view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    
    annotationView.image = [UIImage imageNamed:@"USER"];
    annotationView.annotation = annotation;
    
    return annotationView;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    
    static NSString *AnnotationViewID = @"annotationViewID";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[map_kit_view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    annotationView.image = [UIImage imageNamed:@"USER"];
    
    
    return center;
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0)
{
    NSLog(@"%f",userLocation.location.coordinate.latitude);
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

- (IBAction)btn_search:(id)sender
{
    [self.view endEditing:YES];
    NSString *str=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@",[txt_search.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURL *url=[[NSURL alloc]initWithString:str];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //NSLog(@"%@",dict);
    float lat=[[[[[[dict objectForKey:@"results"]objectAtIndex:0]objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lat"]floatValue];
    float lng=[[[[[[dict objectForKey:@"results"]objectAtIndex:0]objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lng"]floatValue];
    
    CLLocationCoordinate2D loc;
    loc.latitude=lat;
    loc.longitude=lng;
    
    MKCoordinateRegion regin;
    regin.center=loc;
    regin.span.latitudeDelta=0.1;
    regin.span.longitudeDelta=0.1;
    
    static NSString *AnnotationViewID = @"annotationViewID";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[map_kit_view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    
    annotationView.image = [UIImage imageNamed:@"USER"];
    
    
    [map_kit_view setRegion:regin animated:YES];
    [map_kit_view regionThatFits:regin];

}

- (IBAction)btn_back:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];
    
}
@end
