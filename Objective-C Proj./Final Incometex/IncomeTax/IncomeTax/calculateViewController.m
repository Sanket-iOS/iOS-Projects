//
//  calculateViewController.m
//  IncomeTax
//
//  Created by tops on 3/28/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "calculateViewController.h"
#import "paytaxViewController.h"

@interface calculateViewController ()


@end

@implementation calculateViewController

@synthesize button,btngender,lblgen,btnyear,btnincome,lblres,txttax;

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
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b3.jpg"]];
    arrdata = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Resident",@"Non-Resident",@"Ordinaery",nil]];
    
    /*arrdata1 = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Resident",@"Non-Resident",@"Ordinaery",nil]];*/
	
	dropDownView = [[DropDownView alloc] initWithArrayData:arrdata cellHeight:30 heightTableView:100 paddingTop:-8 paddingLeft:-5 paddingRight:100 refView:button animation:BLENDIN openAnimationDuration:0 closeAnimationDuration:0];
	
	dropDownView.delegate = self;
	
	[self.view addSubview:dropDownView.view];
	
	//[button setTitle:[arrayData objectAtIndex:0] forState:UIControlStateNormal];
	
    
    
    arrdata1 = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Male",@"Female",@"Senior citizen(>60)",@"Super Senior Citizen(>80)",nil]];
    
    /*arrdata1 = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:@"Resident",@"Non-Resident",@"Ordinaery",nil]];*/
    
    dropDownGender = [[DropDownGender alloc] initWithArrayData:arrdata1 cellHeight:30 heightTableView:150 paddingTop:-8 paddingLeft:-5 paddingRight:100 refView:btngender animation:BLENDIN1 openAnimationDuration:0 closeAnimationDuration:0];
    
    dropDownGender.delegate = self;
    
    [self.view addSubview:dropDownGender.view];

   

}
-(void)dropDownCellSelected1:(NSInteger)returnIndex{
	
    
    NSLog(@"%@",[arrdata1 objectAtIndex:returnIndex]);
    
    lblgen.text=[arrdata1 objectAtIndex:returnIndex];
	
}
-(void)dropDownCellSelected:(NSInteger)returnIndex{
    
    
    NSLog(@"%@",[arrdata objectAtIndex:returnIndex]);
    
    self.lblres.text = [arrdata objectAtIndex:returnIndex];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)actngender:(id)sender {
    [dropDownGender openAnimation];
    
}

- (IBAction)selectdrplist:(id)sender {
    
    [dropDownView openAnimation];
}

/*
- (IBAction)btngen:(id)sender {
    
    dropDownView = [[DropDownView alloc] initWithArrayData:arrdata cellHeight:30 heightTableView:100 paddingTop:-8 paddingLeft:-5 paddingRight:100 refView:btngender animation:BLENDIN openAnimationDuration:2 closeAnimationDuration:1];
	
	dropDownView.delegate = self;
	
	[self.view addSubview:dropDownView.view];
    
    [dropDownView openAnimation];
    

}*/
/*
- (IBAction)btngender:(id)sender {
   
	dropDownView = [[DropDownView alloc] initWithArrayData:arrdata cellHeight:30 heightTableView:100 paddingTop:-8 paddingLeft:-5 paddingRight:100 refView:buttongen animation:BLENDIN openAnimationDuration:2 closeAnimationDuration:1];
	
	dropDownView.delegate = self;
	
	[self.view addSubview:dropDownView.view];
    
    [dropDownView openAnimation];


  
}*/
- (IBAction)btncalculate:(id)sender {
    int i=[btnincome.text integerValue];
    int total=i-250000;
    float calc;
    NSLog(@"value of i is:%d",i);

    if ([lblgen.text isEqualToString:@"Male" ] || [lblgen.text isEqualToString: @"Female"])
    {
        if (total> 250000 || total<500000)
        {
            calc=(total*10)/100;
            
            
        }
        else if (total > 500000 || total<1000000)
        {
            calc=(total*20)/100;
        }
        else if (total >1000000)
        {
            calc=(total*30)/100;
        }
    }
    else if ([lblgen.text isEqualToString:@"Senior citizen(>60)"])
    {
        
        if (total > 300000 || total<500000)
        {
            calc=(total*10)/100;
        }
        else if (total > 500000 || total<1000000)
        {
            calc=(total*20)/100;
        }
        else if (total > 1000000)
        {
            calc=(total*30)/100;
        }

    }
    else if ([lblgen.text isEqualToString:@"Super Senior Citizen(>80)"])
    {
        if (total > 500000 || total <1000000)
        {
            calc=(total*20)/100;
        }
        else if (total > 1000000)
        {
            calc=(total*30)/100;
        }

    }
    //float totalcalc=i-calc;
    txttax.text= [[NSString alloc]initWithFormat:@"%f",calc];
    NSLog(@"%f",calc);
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:[NSString stringWithFormat:@"Do You Want to Make Payment Tax is %@",txttax.text] delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alrt show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        paytaxViewController *ptax=[self.storyboard instantiateViewControllerWithIdentifier:@"paytx"];
        ptax.stranount=txttax.text;
        [self.navigationController pushViewController:ptax animated:YES];
        
    }

}
@end
