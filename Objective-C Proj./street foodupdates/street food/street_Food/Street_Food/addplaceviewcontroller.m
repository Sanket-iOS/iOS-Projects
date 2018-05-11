//
//  addplaceviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/28/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "addplaceviewcontroller.h"
#import "home_pageviewcontroller.h"

@interface addplaceviewcontroller ()
{
    UIImage *image;
    NSMutableArray *arrCat;
    NSDictionary *dict;
    
    NSString *imgPathStr1;
}
@property (weak, nonatomic) IBOutlet UIVisualEffectView *actView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act;
@property (weak, nonatomic) IBOutlet UITextField *txt_area;

@end

@implementation addplaceviewcontroller
@synthesize txt_address,txt_placename,txt_shopename,txt_speciality,upload_imgview,view_upload,view_form,btn_uploadplaceaction,txt_category;
@synthesize urlstring;
@synthesize defaultConfigObject;
@synthesize defaultSession;
@synthesize urlRequest;
@synthesize params;
@synthesize dataTask;
@synthesize responsedata;
@synthesize view_welcome;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)getCategoryPickerView:(id)sender {
    
    int x = 10;
    int y = 0;
    view_welcome = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(10, 100, 400, 250)];
    view_welcome.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.80];
    view_welcome.clipsToBounds = YES;
    view_welcome.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_welcome.layer.borderWidth = 1.0;
    view_welcome.layer.cornerRadius = 6.0;

    
    //set runtime picker view for get Category
    UIPickerView *pickcategory = [[UIPickerView alloc]initWithFrame:CGRectMake(x, y, 400, 250)];

    //[pickcategory setBackgroundColor: [[UIColor blackColor] colorWithAlphaComponent:0.5]];
    
    [pickcategory setDelegate:(id<UIPickerViewDelegate> ) self];
    
    [view_welcome addSubview:pickcategory];
    
    [self.view addSubview:view_welcome];
    
    
    
    NSURL *urlString = [NSURL URLWithString:@"http://studentzone.16mb.com/getCategories.php"];
    // create the connection
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlString];
    [request setHTTPMethod:@"POST"];
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    dataTask =[defaultSession dataTaskWithRequest:request
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                    NSLog(@"Data = %@",text);
                                    
                                    
                                    responsedata = data;
                                    
                                    arrCat = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                    
                                    
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    [pickcategory reloadAllComponents];
                                    
                                    
                                }];
    [dataTask resume];
    
    


}

//pickerview code


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
   
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    return [arrCat count];
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    dict = [arrCat objectAtIndex:row];
    return [dict objectForKey:@"categoryName"];
}
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [txt_category setText:[[arrCat objectAtIndex:row] objectForKey:@"categoryName"]];
    [view_welcome setHidden:YES];
}
//end picker view code



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_act setHidden:YES];
    [_actView setHidden:YES];
    
    UIImage * imgw = [UIImage imageNamed:@"coffee.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
    //animation code for roundcurve
    
    
    view_form.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.10];
    view_form.clipsToBounds = YES;
    view_form.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_form.layer.borderWidth = 1.0;
    view_form.layer.cornerRadius = 6.0;
    
    view_upload.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.20];
    view_upload.clipsToBounds = YES;
    view_upload.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    view_upload.layer.borderWidth = 1.0;
    view_upload.layer.cornerRadius = 6.0;
    

    txt_address.layer.cornerRadius = 5.0;
    txt_address.clipsToBounds = YES;
    
    txt_placename.layer.cornerRadius = 5.0;
    txt_placename.clipsToBounds = YES;
    
    txt_shopename.layer.cornerRadius = 5.0;
    txt_shopename.clipsToBounds = YES;
    
    txt_speciality.layer.cornerRadius = 5.0;
    txt_speciality.clipsToBounds = YES;
    
    btn_uploadplaceaction.layer.cornerRadius = 5.0;
    btn_uploadplaceaction.clipsToBounds = YES;
    

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

- (IBAction)btn_backaction:(id)sender
{
    home_pageviewcontroller *home =[self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self.navigationController pushViewController:home animated:YES];
}

- (IBAction)btn_uplaodimg:(id)sender
{
  
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [upload_imgview setImage:image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)btn_uploadformaction:(id)sender
{
    
    [_act setHidden:NO];
    [_actView setHidden:NO];
    [_act startAnimating];
       NSURL *urlString = [NSURL URLWithString:@"http://studentzone.16mb.com/saveimage.php"];
    // create the connection
       NSData *imageData = UIImageJPEGRepresentation(image, 90);
    //NSString *urlString = [NSString stringWithFormat:@"%@test.php", delegate.dataBean.hosterURL];
    
    NSString *strTime1=[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];

    NSString *strTime = [strTime1 stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlString];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"%@.png\"\r\n",strTime] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    dataTask =[defaultSession dataTaskWithRequest:request
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                   
                                   //NSLog(@"\n\nData = %@\n\n",imgText);
                                   // imgPathStr1 = [[NSString alloc]initWithString: text1];
                                    
                                    
                                    responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    
                                }];
    [dataTask resume];
    
     NSString *imgText= [[NSString alloc] initWithData: responsedata encoding: NSUTF8StringEncoding];
     params =[NSString stringWithFormat:@"place=%@&Area=%@&Specialities=%@&imageUrl=%@.png&PlaceName=%@&Address=%@&ShopName=%@&catName=%@",txt_placename.text,_txt_area.text,txt_speciality.text,strTime,txt_placename.text,txt_address.text,txt_shopename.text,txt_category.text];
    
    
    NSLog(@"\n%@\n",params);
   // $query= "INSERT INTO `tblplace`( `Area`, `Specialities`, `imageUrl`, `PlaceName`, `Address`, `ShopName`) VALUES ('".$_POST['Area']."','".$_POST['Specialities']."','".$_POST['imageUrl']."','".$_POST['PlaceName']."','".$_POST['Address']."','".$_POST['ShopName']."')";
    
    
    
    urlString = [NSURL URLWithString:@"http://studentzone.16mb.com/addPlaces.php"];
    // create the connection
    

    
    request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlString];
    [request setHTTPMethod:@"POST"];
    
   
    
    
    
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    dataTask =[defaultSession dataTaskWithRequest:request
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                    NSLog(@"Data = %@",text);
                                    
                                    
                                    responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    
                                    [_act setHidden:YES];
                                    [_actView setHidden:YES];
                                    
                                }];
    [dataTask resume];
    
    
    

    
}


@end
