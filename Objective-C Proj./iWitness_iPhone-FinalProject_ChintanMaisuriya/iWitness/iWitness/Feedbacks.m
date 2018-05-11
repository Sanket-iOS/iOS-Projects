//
//  Feedbacks.m
//  iWitness
//
//  Created by MACOS on 7/1/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "Feedbacks.h"
#import "SWRevealViewController.h"
@interface Feedbacks ()

@end

@implementation Feedbacks
{
    NSString *checkStatus;
    NSString *ratingString;
}
@synthesize txtviewFeedbacks,ratingview,btnSendFeedback,button,setFlag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[_viewFeedback setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    _viewFeedback.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.1];
    _viewFeedback.layer.shadowColor=[[UIColor blackColor]CGColor];
    _viewFeedback.layer.shadowOffset=CGSizeMake(0,0);
    _viewFeedback.layer.shadowOpacity=0.5;
    _viewFeedback.layer.shadowRadius=2.0;
    _viewFeedback.layer.cornerRadius=5;
    
    txtviewFeedbacks.layer.borderWidth=0.2;
    txtviewFeedbacks.layer.borderColor=[[UIColor grayColor]CGColor];
    txtviewFeedbacks.layer.cornerRadius=10;
    [txtviewFeedbacks setDelegate:self];
    
    ratingview.backgroundImage=[UIImage imageNamed:@"starsbackgroundiOS.png"];
    ratingview.starImage = [[UIImage imageNamed:@"star-template"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    ratingview.starHighlightedImage = [[UIImage imageNamed:@"star-highlighted-template"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    ratingview.maxRating = 5.0;
    ratingview.delegate = self;
    ratingview.horizontalMargin = 15.0;
    ratingview.editable=YES;
    ratingview.rating= 0.0;
    ratingview.displayMode=EDStarRatingDisplayHalf;
    [ratingview  setNeedsDisplay];
    ratingview.tintColor = [UIColor colorWithRed:0.11f green:0.38f blue:0.94f alpha:1.0f];
    [self starsSelectionChanged:ratingview rating:0.0];
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];
    
    if (setFlag) {
        button=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"SidebarMenu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Drawerviewaction:)];
        self.navigationItem.leftBarButtonItem=button;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}

-(void)Drawerviewaction:(id)sender
{
    button.tag=10;
    button.target=self.revealViewController;
    button.action=@selector(revealToggle:);
    self.revealViewController.rearViewRevealWidth=190.0f;
    [self.view addGestureRecognizer:[self.revealViewController tapGestureRecognizer]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)starsSelectionChanged:(EDStarRating *)control rating:(float)rating
{
    ratingString = [NSString stringWithFormat:@"%.1f", rating];
}

- (IBAction)btnSendFeedback:(id)sender {
    
    NSString *str = [NSString stringWithFormat:@"http://localhost/iWitness_WS/feedback.php?userID=%@&feedbacks=%@&rates=%@",strGetUID,txtviewFeedbacks.text,ratingString];
    
    NSString *sendFeedbackStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *fbURL = [NSURL URLWithString:sendFeedbackStr];
    NSURLRequest *fbREQ = [NSURLRequest requestWithURL:fbURL];
    
    NSURLSession *fbSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *fbSDTask = [fbSession dataTaskWithRequest:fbREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        checkStatus = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if ([checkStatus isEqualToString:@"success\n"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Thank you so much for your feedbacks. Keep in touch." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
            
            [alert addAction:Ok];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alert animated:YES completion:nil];
            });
        }
    }];
    [fbSDTask resume];
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([txtviewFeedbacks.text length] > 0) {
        [self.lblPlaceHolderText setHidden:YES];
    } else {
        [self.lblPlaceHolderText setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
