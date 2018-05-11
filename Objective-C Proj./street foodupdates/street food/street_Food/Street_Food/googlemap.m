//
//  googlemap.m
//  Street_Food
//
//  Created by MACOS on 20/10/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "googlemap.h"

@interface googlemap ()

@end

@implementation googlemap

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"");
    locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    locationManager.delegate = self; // we set the delegate of locationManager to self.
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"fail to access");
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    
    NSString *lat = [NSString stringWithFormat:@"%f",crnLoc.coordinate.latitude];
    NSString *log = [NSString stringWithFormat:@"%f",crnLoc.coordinate.longitude];
    
    
    NSLog(@"%f",crnLoc.coordinate.latitude);
    NSLog(@"%f",crnLoc.coordinate.longitude);
    
    
    
    [locationManager stopUpdatingLocation];
    
    NSString *str = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=500&types=food&key=AIzaSyC-KLAzAta-ShQh8wA51kvYsftm7Bh6uEc",lat,log];
    //  NSString *str = @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=5000&types=food&name=cruise&key=AIzaSyC-KLAzAta-ShQh8wA51kvYsftm7Bh6uEc";
    
    
    
    NSURL *url = [NSURL URLWithString:str];
    NSData *dt = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *dic =[ NSJSONSerialization JSONObjectWithData:dt options:kNilOptions error:nil];
    
    // NSLog(@"%@",[dic description]);
    
    
    NSArray *arr =[ dic valueForKey:@"results"];
    
    
    NSMutableArray *final =[[NSMutableArray alloc]init];
    for (NSDictionary *dic1 in arr) {
        
        NSDictionary *dic2 = [dic1 valueForKey:@"geometry"];
        
        nm=[dic1 valueForKey:@"name"];
        
        NSDictionary  *dic3 = [dic2 valueForKey:@"location"];
        
        
        NSMutableArray *temp =[[NSMutableArray alloc]init];
        
        [temp addObject:[dic3 valueForKey:@"lat"]];
        [temp addObject:[dic3 valueForKey:@"lng"]];
        [temp addObject:nm];
        [final addObject:temp];
        
        
        
        
    }
    
    
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:crnLoc.coordinate.latitude
                                                            longitude:crnLoc.coordinate.longitude
                                                                 zoom:13.50];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    for (int i =0; i<[final count]; i++) {
        
        NSMutableArray *temp =[[NSMutableArray alloc]init];
        
        temp = [final objectAtIndex:i];
        
        
        float a1 = [[temp objectAtIndex:0] floatValue];
        float  a2 = [[temp objectAtIndex:1]floatValue];
        
        //NSString *nm1=[[temp objectAtIndex:2]string];
        
        //NSString *nm1=[NSString stringWithFormat:@"%@",nm];
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(a1, a2);
        marker.appearAnimation = kGMSMarkerAnimationPop;
        // marker.icon=[UIImage imageNamed:@"car.png"];
        //marker.flat=YES;
        marker.title=[temp objectAtIndex:2];
        marker.map = mapView;
        
    }

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
