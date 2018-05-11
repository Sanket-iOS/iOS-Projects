//
//  userProfile_TVC.m
//  iWitness
//
//  Created by MACOS on 7/7/16.
//  Copyright © 2016 MAC OS. All rights reserved.
//

#import "userProfile_TVC.h"
#import "profileCell.h"
#import "ProfileCustCell.h"
#import "detailProfileCell.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"
#import "SWRevealViewController.h"

@interface userProfile_TVC (){
    UIImage *uPic;
    UIImage *uImgPicker;
    UIImageView *imgUProfile;
    UITextField *txtUFname;
    UITextField *txtULname;
    UITextField *txtAddress;
    UITextField *txtContact;
    UITextField *txtEmail;
    UIVisualEffectView *blur;
    UIButton *btnDone;
    
    NSString *checkStatus;
    BOOL flag;
}

@end

@implementation userProfile_TVC
@synthesize userProfileTVC,button,setFlag;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    
    flag=false;
    
    UIBarButtonItem *btnSave = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(taskDone)];
    self.navigationItem.rightBarButtonItem=btnSave;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //[userProfileTVC setSeparatorColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"separatorline.png"]]];
    [userProfileTVC setSeparatorColor:[UIColor colorWithRed:224/255.00f green:228/255.00f blue:244/255.00f alpha:1.0f]];
    userProfileTVC.scrollEnabled=NO;
    
    user = [[NSMutableArray alloc]init];
    userInfo = [[NSMutableArray alloc]init];
    imgIconArr = [[NSArray alloc]initWithObjects:@"Home2.png",@"telephone.png",@"Email.png",nil];
    datainfo = [[NSArray alloc]initWithObjects:@"Address",@"Contact",@"Email",nil];
    dataIndicate = [[NSArray alloc]initWithObjects:@"Add address",@"Add contact no.",@"Add email",nil];
    exampleinfo = [[NSArray alloc]initWithObjects:@"e.g. Anand villa, Surat",@"9xxxxxxxxx",@"xyz@gmail.com",nil];
    
    NSUserDefaults *uDef = [NSUserDefaults standardUserDefaults];
    strGetUID=[uDef valueForKey:@"UID"];

    
    NSString *strUP = [NSString stringWithFormat:@"http://localhost/iWitness_WS/userProfile.php?uID=%@",strGetUID];
    NSURL *urlUP = [NSURL URLWithString:strUP];
    NSURLRequest *urlReqUP = [NSURLRequest requestWithURL:urlUP];
    NSURLSession *upSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *upSDTask = [upSession dataTaskWithRequest:urlReqUP completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        getUserData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        dispatch_async(dispatch_get_main_queue(), ^{[userProfileTVC reloadData];});
        
        if ([getUserData count]>0) {
            uFName=[[getUserData valueForKey:@"UName"]objectAtIndex:0];
            uLName=[[getUserData valueForKey:@"USurname"]objectAtIndex:0];
            uName=[NSString stringWithFormat:@"%@ %@",uFName, uLName];
            uAddress=[[getUserData valueForKey:@"UAddress"]objectAtIndex:0];
            uContact=[[getUserData valueForKey:@"UContact"]objectAtIndex:0];
            uEmail=[[getUserData valueForKey:@"UEmail"]objectAtIndex:0];
            
            NSString *imgCheck = [[getUserData valueForKey:@"UProfilePic"]objectAtIndex:0];

            if (![imgCheck isEqual:[NSNull null]]&& ![imgCheck isEqual:@""]) {
                uPic = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[getUserData valueForKey:@"UProfilePic"]objectAtIndex:0]]]];
            }else{
                uPic = [UIImage imageNamed:@"person1.png"];
            }
        }
        
        [userInfo addObject:uAddress];
        [userInfo addObject:uContact];
        [userInfo addObject:uEmail];
    }];
    [upSDTask resume];
    
    if (setFlag) {
        button=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"SidebarMenu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(Drawerviewaction:)];
        self.navigationItem.leftBarButtonItem=button;
    }
}

-(void)viewDidAppear:(BOOL)animated{
[userProfileTVC reloadData];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    if (section==0) {
        return 1;
    }else if (section==1){
        return 1;
    }else{
        return userInfo.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        profileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pCell1"];
        cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileback1.jpg"]];
        cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileback1.jpg"]];
        cell.backgroundView.alpha=0.9f;
        cell.selectedBackgroundView.alpha=0.9f;
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.separatorInset=UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
        cell.imgUser.layer.cornerRadius=30;
        cell.imgUser.layer.masksToBounds=true;
        cell.imgUser.layer.borderWidth=2.0f;
        cell.imgUser.layer.borderColor=[[UIColor whiteColor] CGColor];
        
        cell.imgEdit.image = [UIImage imageNamed:@"edit1.png"];
        cell.lblUFName.text=uName;
        cell.imgUser.image = uPic;
        
        return cell;
    }
    else if (indexPath.section==1){
        
        ProfileCustCell *custCell = [tableView dequeueReusableCellWithIdentifier:@"pCell2"];
        
        NSString *strInfo = [NSString stringWithFormat:@"Please note that your personal information provided in the profile will be confidential"];
        custCell.lblInfo.text = strInfo;
        
        [custCell setLayoutMargins:UIEdgeInsetsZero];
        custCell.separatorInset=UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
        custCell.userInteractionEnabled=NO;
        return custCell;
    }
    else{
        detailProfileCell *dpCell = [tableView dequeueReusableCellWithIdentifier:@"pCell3"];
        dpCell.separatorInset = UIEdgeInsetsMake(0, dpCell.bounds.size.width, 0, 0);
        
        dpCell.imgIcon.image = [UIImage imageNamed:[imgIconArr objectAtIndex:indexPath.row]];
        
        NSString *tempUD = [userInfo objectAtIndex:indexPath.row];
        NSString *tempDI = [datainfo objectAtIndex:indexPath.row];
        NSString *tempDIndi = [dataIndicate objectAtIndex:indexPath.row];
        NSString *tempEI = [exampleinfo objectAtIndex:indexPath.row];
        
        if (![tempUD isEqualToString:@""]) {
              dpCell.lblDetail.text=tempUD;
              dpCell.lblDetail.textColor = [UIColor blackColor];
        }else{
              dpCell.lblDetail.text=tempDIndi;
              dpCell.lblDetail.textColor = [UIColor grayColor];
              //dpCell.lblDetail.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        }
        
        if (![tempUD isEqualToString:@""]) {
              dpCell.lbleg.text=tempDI;
            dpCell.lbleg.textColor = [UIColor darkGrayColor];
        }else{
              dpCell.lbleg.text=tempEI;
              dpCell.lbleg.textColor = [UIColor grayColor];
              //dpCell.lblDetail.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        }
        
        if (![tempUD isEqualToString:@""]) {
             dpCell.imgEdit.image = [UIImage imageNamed:@"edit2.png"];
        }else{
             dpCell.imgEdit.image = [UIImage imageNamed:@"plus.png"];
        }
     
        return dpCell;
     }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0){
        return  120.1;
    }else if (indexPath.section==1){
        return 50.1;
    }else{
        return 60.1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        UIView *uNameView = [[UIView alloc]initWithFrame:CGRectMake(15, 60, 291, 268)];
        [uNameView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        uNameView.layer.shadowColor=[[UIColor blackColor]CGColor];
        uNameView.layer.shadowOffset=CGSizeMake(7,7);
        uNameView.layer.shadowOpacity=0.9;
        uNameView.layer.shadowRadius=5.0;
        uNameView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:uNameView.bounds]CGPath];
        uNameView.layer.cornerRadius=9;
        
        blur = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 391, 504)];
        blur.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
        
        imgUProfile = [[UIImageView alloc]initWithFrame:CGRectMake(20, 12, 60, 60)];
        [imgUProfile setContentMode:UIViewContentModeScaleAspectFill];
        imgUProfile.clipsToBounds = YES;
        imgUProfile.backgroundColor=[UIColor whiteColor];
        imgUProfile.layer.cornerRadius=30;
        imgUProfile.layer.borderWidth=2.0f;
        imgUProfile.layer.borderColor=[[UIColor darkGrayColor] CGColor];
        
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(uImgPicker)];
        tap.numberOfTapsRequired=1;
        imgUProfile.userInteractionEnabled=YES;
        [imgUProfile addGestureRecognizer:tap];

        
        
        UILabel *lbluPic = [[UILabel alloc]initWithFrame:CGRectMake(85, 30, 200, 30)];
        [lbluPic setFont:[UIFont fontWithName:@"Savoye LET" size:23]];
        lbluPic.textColor = [UIColor darkGrayColor];
        lbluPic.text=@"< Tap to change profile picture";
        
        
        UILabel *lbluFname = [[UILabel alloc]initWithFrame:CGRectMake(25, 80, 260, 30)];
        [lbluFname setFont:[UIFont fontWithName:@"Savoye LET" size:20]];
        lbluFname.textColor = [UIColor darkGrayColor];
        lbluFname.text=@"First Name";
        
        UILabel *lbluLname = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, 260, 30)];
        [lbluLname setFont:[UIFont fontWithName:@"Savoye LET" size:20]];
        lbluLname.textColor = [UIColor darkGrayColor];
        lbluLname.text=@"Last Name";
        
        
        txtUFname = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, 260, 30)];
        [txtUFname setBorderStyle:UITextBorderStyleRoundedRect];
        txtUFname.backgroundColor=[UIColor lightTextColor];
        [txtUFname setFont:[UIFont fontWithName:@"Arial" size:14]];
        txtUFname.placeholder=@"Enter first name";
        txtUFname.clearButtonMode=UITextFieldViewModeAlways;
        
        txtULname = [[UITextField alloc]initWithFrame:CGRectMake(20, 160, 260, 30)];
        [txtULname setBorderStyle:UITextBorderStyleRoundedRect];
        txtULname.backgroundColor=[UIColor lightTextColor];
        [txtULname setFont:[UIFont fontWithName:@"Arial" size:14]];
        txtULname.placeholder=@"Enter last name";
        txtULname.clearButtonMode=UITextFieldViewModeAlways;
        
        UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(31, 215, 120, 30)];
        btnCancel.userInteractionEnabled=YES;
        btnCancel.backgroundColor=[UIColor colorWithRed:255/255.00f green:57/255.00f blue:70/255.00f alpha:0.9];
        [btnCancel setTitle:[NSString stringWithFormat:@"Cancel"] forState:UIControlStateNormal];
        [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnCancel.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [btnCancel addTarget:self action:@selector(cancelSubview) forControlEvents:UIControlEventTouchUpInside];
        
        btnDone = [[UIButton alloc]initWithFrame:CGRectMake(154, 215, 120, 30)];
        btnDone.tag=1;
        btnDone.userInteractionEnabled=YES;
        btnDone.backgroundColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
        btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
        [btnDone setTitle:[NSString stringWithFormat:@"Done"] forState:UIControlStateNormal];
        [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnDone.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [btnDone addTarget:self action:@selector(dataSave) forControlEvents:UIControlEventTouchUpInside];
        
        [uNameView addSubview:imgUProfile];
        [uNameView addSubview:lbluPic];
        [uNameView addSubview:lbluFname];
        [uNameView addSubview:txtUFname];
        [uNameView addSubview:lbluLname];
        [uNameView addSubview:txtULname];
        [uNameView addSubview:btnCancel];
        [uNameView addSubview:btnDone];

        [blur addSubview:uNameView];
        [self.view addSubview:blur];
        
        imgUProfile.image=uPic;
        txtUFname.text=uFName;
        txtULname.text=uLName;
    }

    if (indexPath.section==2){
        if (indexPath.row==0) {
        
            UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(15, 60, 291, 268)];
            [addressView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            addressView.layer.shadowColor=[[UIColor blackColor]CGColor];
            addressView.layer.shadowOffset=CGSizeMake(5,5);
            addressView.layer.shadowOpacity=0.8;
            addressView.layer.shadowRadius=2.0;
            addressView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:addressView.bounds]CGPath];
            addressView.layer.cornerRadius=9;
            
            blur = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 391, 504)];
            blur.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
            
            UILabel *lblAddress = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 260, 30)];
            [lblAddress setFont:[UIFont fontWithName:@"Savoye LET" size:25]];
            //[lblAddress setFont:[UIFont systemFontOfSize:36]];
            lblAddress.textColor = [UIColor darkGrayColor];
            lblAddress.text=@"Address";
            
            
            txtAddress = [[UITextField alloc]initWithFrame:CGRectMake(20, 110, 262, 30)];
            [txtAddress setBorderStyle:UITextBorderStyleRoundedRect];
            txtAddress.backgroundColor=[UIColor whiteColor];
            [txtAddress setFont:[UIFont fontWithName:@"Arial" size:14]];
            txtAddress.placeholder=@"Enter your address";
            txtAddress.clearButtonMode=UITextFieldViewModeAlways;
            
            UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(31, 200, 120, 30)];
            btnCancel.userInteractionEnabled=YES;
            btnCancel.backgroundColor=[UIColor colorWithRed:255/255.00f green:57/255.00f blue:70/255.00f alpha:0.9];
            [btnCancel setTitle:[NSString stringWithFormat:@"Cancel"] forState:UIControlStateNormal];
            [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnCancel.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnCancel addTarget:self action:@selector(cancelSubview) forControlEvents:UIControlEventTouchUpInside];
            
            btnDone = [[UIButton alloc]initWithFrame:CGRectMake(154, 200, 120, 30)];
            btnDone.tag=2;
            btnDone.userInteractionEnabled=YES;
            btnDone.backgroundColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
            btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
            [btnDone setTitle:[NSString stringWithFormat:@"Done"] forState:UIControlStateNormal];
            [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnDone.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnDone addTarget:self action:@selector(dataSave) forControlEvents:UIControlEventTouchUpInside];
            
            [addressView addSubview:lblAddress];
            [addressView addSubview:txtAddress];
            [addressView addSubview:btnCancel];
            [addressView addSubview:btnDone];

            [blur addSubview:addressView];
            [self.view addSubview:blur];
            
            txtAddress.text=[userInfo objectAtIndex:0];
            
        }else if (indexPath.row==1) {
            UIView *contactView = [[UIView alloc]initWithFrame:CGRectMake(15, 60, 291, 268)];
            [contactView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            contactView.layer.shadowColor=[[UIColor blackColor]CGColor];
            contactView.layer.shadowOffset=CGSizeMake(5,5);
            contactView.layer.shadowOpacity=0.8;
            contactView.layer.shadowRadius=2.0;
            contactView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:contactView.bounds]CGPath];
            contactView.layer.cornerRadius=9;
            
            blur = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 391, 504)];
            blur.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
            
            UILabel *lblContact = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 260, 30)];
            [lblContact setFont:[UIFont fontWithName:@"Savoye LET" size:25]];
            lblContact.textColor = [UIColor darkGrayColor];
            lblContact.text=@"Contact";
            
            
            txtContact = [[UITextField alloc]initWithFrame:CGRectMake(20, 110, 262, 30)];
            [txtContact setBorderStyle:UITextBorderStyleRoundedRect];
            txtContact.backgroundColor=[UIColor whiteColor];
            [txtContact setFont:[UIFont fontWithName:@"Arial" size:14]];
            txtContact.placeholder=@"Enter your contact";
            txtContact.clearButtonMode=UITextFieldViewModeAlways;
            
            UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(31, 200, 120, 30)];
            btnCancel.backgroundColor=[UIColor colorWithRed:255/255.00f green:57/255.00f blue:70/255.00f alpha:0.9];
            [btnCancel setTitle:[NSString stringWithFormat:@"Cancel"] forState:UIControlStateNormal];
            [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnCancel.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnCancel addTarget:self action:@selector(cancelSubview) forControlEvents:UIControlEventTouchUpInside];

            
            btnDone = [[UIButton alloc]initWithFrame:CGRectMake(154, 200, 120, 30)];
            btnDone.tag=3;
            btnDone.userInteractionEnabled=YES;
            btnDone.backgroundColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
            btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
            [btnDone setTitle:[NSString stringWithFormat:@"Done"] forState:UIControlStateNormal];
            [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnDone.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnDone addTarget:self action:@selector(dataSave) forControlEvents:UIControlEventTouchUpInside];
            
            [contactView addSubview:lblContact];
            [contactView addSubview:txtContact];
            [contactView addSubview:btnCancel];
            [contactView addSubview:btnDone];

            [blur addSubview:contactView];
            [self.view addSubview:blur];
            
            txtContact.text=[userInfo objectAtIndex:1];
            
        }else if (indexPath.row==2) {
            UIView *emailView = [[UIView alloc]initWithFrame:CGRectMake(15, 60, 291, 268)];
            [emailView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            emailView.layer.shadowColor=[[UIColor blackColor]CGColor];
            emailView.layer.shadowOffset=CGSizeMake(5,5);
            emailView.layer.shadowOpacity=0.8;
            emailView.layer.shadowRadius=2.0;
            emailView.layer.shadowPath=[[UIBezierPath bezierPathWithRect:emailView.bounds]CGPath];
            emailView.layer.cornerRadius=9;
            
            blur = [[UIVisualEffectView alloc]initWithFrame:CGRectMake(0, 0, 391, 504)];
            blur.backgroundColor=[UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:0.7f];
            
            UILabel *lblEmail = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 260, 30)];
            [lblEmail setFont:[UIFont fontWithName:@"Savoye LET" size:25]];
            lblEmail.textColor = [UIColor darkGrayColor];
            lblEmail.text=@"Email";
            
            
            txtEmail = [[UITextField alloc]initWithFrame:CGRectMake(20, 110, 262, 30)];
            [txtEmail setBorderStyle:UITextBorderStyleRoundedRect];
            txtEmail.backgroundColor=[UIColor whiteColor];
            [txtEmail setFont:[UIFont fontWithName:@"Arial" size:14]];
            txtEmail.placeholder=@"Enter your email";
            txtEmail.clearButtonMode=UITextFieldViewModeAlways;
            
            UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(31, 200, 120, 30)];
            btnCancel.backgroundColor=[UIColor colorWithRed:255/255.00f green:57/255.00f blue:70/255.00f alpha:0.9];
            [btnCancel setTitle:[NSString stringWithFormat:@"Cancel"] forState:UIControlStateNormal];
            [btnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnCancel.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnCancel addTarget:self action:@selector(cancelSubview) forControlEvents:UIControlEventTouchUpInside];
            
            
            btnDone = [[UIButton alloc]initWithFrame:CGRectMake(154, 200, 120, 30)];
            btnDone.tag=4;
            btnDone.userInteractionEnabled=YES;
            btnDone.backgroundColor=[UIColor colorWithRed:48/255.00f green:173/255.00f blue:255/255.00f alpha:0.9];
            btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
            [btnDone setTitle:[NSString stringWithFormat:@"Done"] forState:UIControlStateNormal];
            [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btnDone.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [btnDone addTarget:self action:@selector(dataSave) forControlEvents:UIControlEventTouchUpInside];
            
            [emailView addSubview:lblEmail];
            [emailView addSubview:txtEmail];
            [emailView addSubview:btnCancel];
            [emailView addSubview:btnDone];

            [blur addSubview:emailView];
            [self.view addSubview:blur];
            
            txtEmail.text=[userInfo objectAtIndex:2];
        }
    }
}


-(void)uImgPicker{
    UIImagePickerController *uImg = [[UIImagePickerController alloc]init];
    uImg.delegate=self;
    uImg.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:uImg animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    uImgPicker = info[UIImagePickerControllerOriginalImage];
    imgUProfile.image=uImgPicker;
    flag=true;
}

-(void)dataSave{
    if (btnDone.tag==1) {
        if (flag==true) {
            uPic=uImgPicker;
        }
        flag=false;
        
        uName = [NSString stringWithFormat:@"%@ %@",txtUFname.text,txtULname.text];
        uFName=txtUFname.text;
        uLName=txtULname.text;
        getImgUser=[[UIImageView alloc]initWithImage:uPic];
        blur.hidden=YES;
        [userProfileTVC reloadData];
    }
    if (btnDone.tag==2){
        [userInfo replaceObjectAtIndex:0 withObject:txtAddress.text];
        blur.hidden=YES;
        [userProfileTVC reloadData];
    }else if (btnDone.tag==3){
        [userInfo replaceObjectAtIndex:1 withObject:txtContact.text];
        blur.hidden=YES;
        [userProfileTVC reloadData];
    }else if (btnDone.tag==4){
        [userInfo replaceObjectAtIndex:2 withObject:txtEmail.text];
        blur.hidden=YES;
        [userProfileTVC reloadData];
    }
}


-(void)cancelSubview{

    blur.hidden=YES;
}

-(void)taskDone{
    
    //To generate random name for userImage...
//    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//    NSMutableString *randomString = [NSMutableString stringWithCapacity: 5];
//
//   for (int i=0; i<5; i++) {
//       [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
//   }
//   [randomString appendString:@".jpg"];
    
    
    //To upload userImage...
    NSMutableString *randomString = [[NSMutableString alloc]init];
    [randomString appendFormat:@"%@%@",uFName,uLName];
    [randomString appendString:@".jpg"];
    
    NSURL *URL = [NSURL URLWithString:@"http://localhost"];
    NSDictionary *parameters = @{@"username": @"csmaisuriya", @"password" : @"csm12345"};
    NSData *imageData = UIImageJPEGRepresentation(getImgUser.image, 0.5);
    if (imageData!=nil) {
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:URL];
        //  manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager POST:@"/iWitness_WS/index.php" parameters:parameters constructingBodyWithBlock:^ void(id<AFMultipartFormData> formData){
            [formData appendPartWithFileData:imageData name:@"file" fileName:randomString mimeType:@"image/jpeg"];
        } success:^ void(NSURLSessionDataTask *operaton , id responseObject) {
            NSLog(@"success%@",responseObject);
        } failure:^ void(NSURLSessionDataTask * opration, NSError * err) {
            NSLog(@"Error: %@", err);
        }];

    }
    
    
    StrUAdd = [userInfo objectAtIndex:0];
    StrUCont = [userInfo objectAtIndex:1];
    StrUEmail = [userInfo objectAtIndex:2];
    
    NSMutableString *getImgPath = [[NSMutableString alloc]initWithString:@"http://localhost/iWitness_WS/uploads/"];
    [getImgPath appendString:randomString];

    NSString *str = [NSString stringWithFormat:@"http://localhost/iWitness_WS/updateUserProfile.php?uID=%@&ufname=%@&ulname=%@&uadd=%@&ucont=%@&uemail=%@&upic=%@",strGetUID,uFName,uLName,StrUAdd,StrUCont,StrUEmail,getImgPath];
    
   NSString *upStr=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *upURL = [NSURL URLWithString:upStr];
    NSURLRequest *upREQ = [NSURLRequest requestWithURL:upURL];
    
    NSURLSession *upSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *upSDTask = [upSession dataTaskWithRequest:upREQ completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        checkStatus = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if ([checkStatus isEqualToString:@"Success\n"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Hola!" message:@"Your profile updated successfully" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:Ok];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alert animated:YES completion:nil];
            });
        }
    }];
    [upSDTask resume];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
