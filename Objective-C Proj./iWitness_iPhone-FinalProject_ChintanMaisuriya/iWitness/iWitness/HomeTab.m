//
//  HomeTab.m
//  iWitness
//
//  Created by MACOS on 6/20/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "HomeTab.h"
#import "ChangePassword.h"
#import "Complaint.h"
#import "ComplaintStatus.h"
#import "MissingPersonList.h"
#import "WantedPersonsList.h"
#import "Suggestions.h"
#import "Feedbacks.h"
#import "userProfile_TVC.h"
#import "ViewController.h"
#import "SWRevealViewController.h"

@interface HomeTab ()

@end

@implementation HomeTab
@synthesize lblUName,menuList,profileView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    NSArray *recUName = [uDef valueForKey:@"uName"];
    //NSString *UName = recUName;
    NSString *showUName = [NSString stringWithFormat:@"Welcome %@, вε α sεℓғ εvι∂εηcε",recUName];
    
    lblUName.text=showUName;
    //[lblUName setFont:[UIFont fontWithName:@"Savoye LET" size:25.0]];
    
    _btnComplaint.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnComplaint.layer.shadowOffset=CGSizeMake(4.0,1.5);
    _btnComplaint.layer.shadowOpacity=0.9;
    _btnComplaint.layer.shadowRadius=3.0;
    _btnComplaint.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnComplaint.bounds]CGPath];
    
    _btnComplaintStatus.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnComplaintStatus.layer.shadowOffset=CGSizeMake(4.0,1.5);
    _btnComplaintStatus.layer.shadowOpacity=0.9;
    _btnComplaintStatus.layer.shadowRadius=3.0;
    _btnComplaintStatus.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnComplaintStatus.bounds]CGPath];
    
    _btnMPs.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnMPs.layer.shadowOffset=CGSizeMake(4.0,1.5);
    _btnMPs.layer.shadowOpacity=0.9;
    _btnMPs.layer.shadowRadius=3.0;
    _btnMPs.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnMPs.bounds]CGPath];
    
    _btnWPs.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnWPs.layer.shadowOffset=CGSizeMake(4.0,-2.0);
    _btnWPs.layer.shadowOpacity=1.0;
    _btnWPs.layer.shadowRadius=3.0;
    _btnWPs.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnWPs.bounds]CGPath];
    
    _btnSuggestions.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnSuggestions.layer.shadowOffset=CGSizeMake(4.0,-2.0);
    _btnSuggestions.layer.shadowOpacity=1.0;
    _btnSuggestions.layer.shadowRadius=3.0;
    _btnSuggestions.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnSuggestions.bounds]CGPath];
    
    _btnFeedbacks.layer.shadowColor=[[UIColor blackColor]CGColor];
    _btnFeedbacks.layer.shadowOffset=CGSizeMake(4.0,-2.0);
    _btnFeedbacks.layer.shadowOpacity=1.0;
    _btnFeedbacks.layer.shadowRadius=3.0;
    _btnFeedbacks.layer.shadowPath=[[UIBezierPath bezierPathWithRect:_btnFeedbacks.bounds]CGPath];
    
    
    menuList.tag=10;
    menuList.target=self.revealViewController;
    menuList.action=@selector(revealToggle:);
    self.revealViewController.rearViewRevealWidth=190.0f;
    [self.view addGestureRecognizer:[self.revealViewController tapGestureRecognizer]];
    
    check=NO;
    profileView.hidden=YES;
    profileView.layer.borderWidth=4;
    profileView.layer.borderColor=[[UIColor groupTableViewBackgroundColor]CGColor];
    profileView.layer.cornerRadius=1;
    
    profileView.layer.shadowColor=[[UIColor blackColor]CGColor];
    profileView.layer.shadowOffset=CGSizeMake(3,3);
    profileView.layer.shadowOpacity=0.8;
    profileView.layer.shadowRadius=2.0;
    profileView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:profileView.bounds]CGPath];
    
    profileView.frame=CGRectMake(213, 25, self.view.frame.size.width, self.view.frame.size.height);
}
-(void)viewWillAppear:(BOOL)animated{
    check=NO;
   // [self.revealViewController.frontViewController.view setUserInteractionEnabled:NO];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView transitionWithView:profileView duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{profileView.frame=CGRectMake(320, self.profileView.frame.origin.y, self.profileView.frame.size.width, self.profileView.frame.size.height);
    } completion:nil];
    check=NO;
}

- (IBAction)btnProfile:(id)sender {
    if (check==NO) {
        profileView.hidden=NO;
        [UIView transitionWithView:profileView duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{profileView.frame=CGRectMake(170, self.profileView.frame.origin.y, self.profileView.frame.size.width, self.profileView.frame.size.height);
        } completion:nil];
        check=YES;
    }else{
        [UIView transitionWithView:profileView duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{profileView.frame=CGRectMake(320, self.profileView.frame.origin.y, self.profileView.frame.size.width, self.profileView.frame.size.height);
        } completion:nil];
        check=NO;
    }
}

- (IBAction)btnDetailProfile:(id)sender {
    userProfile_TVC *navUP = [self.storyboard instantiateViewControllerWithIdentifier:@"up_SB"];
    [self.navigationController pushViewController:navUP animated:YES];
}

- (IBAction)btnResetPWD:(id)sender {
    ChangePassword *navCP = [self.storyboard instantiateViewControllerWithIdentifier:@"cp_SB"];
    [self.navigationController pushViewController:navCP animated:YES];
}

- (IBAction)btnSignOut:(id)sender {
    
    [UIView transitionWithView:profileView duration:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{profileView.frame=CGRectMake(320, self.profileView.frame.origin.y, self.profileView.frame.size.width, self.profileView.frame.size.height);
    } completion:nil];
    check=NO;
    
    UIAlertController *soAlt = [UIAlertController alertControllerWithTitle:@"Caution!" message:@"Do you really wants to signout" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *YesAct = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
        [uDef removeObjectForKey:@"uName"];
        [uDef removeObjectForKey:@"UID"];
        [uDef removeObjectForKey:@"UOpwd"];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        window.rootViewController = [storyboard instantiateInitialViewController];
    }];
    
    UIAlertAction *NoAct = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [soAlt addAction:NoAct];
    [soAlt addAction:YesAct];
    [self presentViewController:soAlt animated:YES completion:nil];
    
    
}

- (IBAction)btnComplaint:(id)sender {
    Complaint *navComplaint = [self.storyboard instantiateViewControllerWithIdentifier:@"Complaint_SB"];
    [self.navigationController pushViewController:navComplaint animated:YES];
}

- (IBAction)btnComplaintStatus:(id)sender {
    ComplaintStatus *navCS = [self.storyboard instantiateViewControllerWithIdentifier:@"complaintStatus_SB"];
    [self.navigationController pushViewController:navCS animated:YES];
}

- (IBAction)btnMPs:(id)sender {
    MissingPersonList *navMPs = [self.storyboard instantiateViewControllerWithIdentifier:@"mpList_SB"];
    [self.navigationController pushViewController:navMPs animated:YES];
}

- (IBAction)btnWPs:(id)sender {
    WantedPersonsList *navWPs = [self.storyboard instantiateViewControllerWithIdentifier:@"wpList_SB"];
    [self.navigationController pushViewController:navWPs animated:YES];
}

- (IBAction)btnSuggestions:(id)sender {
    Suggestions *navSuggestions = [self.storyboard instantiateViewControllerWithIdentifier:@"suggetions_SB"];
    [self.navigationController pushViewController:navSuggestions animated:YES];
}

- (IBAction)btnFeedbacks:(id)sender {
    Feedbacks *navFeedbacks = [self.storyboard instantiateViewControllerWithIdentifier:@"feedbacks_SB"];
    [self.navigationController pushViewController:navFeedbacks animated:YES];
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

//-(void)actionProfile:(id)sender{
//    if (check==NO) {
//        profileView.hidden=NO;
//        // [UIView transitionWithView:profileView duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^{profileView.hidden=NO;} completion:nil];
//        check=YES;
//    }else{
//        profileView.hidden=YES;
//    }
//}

@end
