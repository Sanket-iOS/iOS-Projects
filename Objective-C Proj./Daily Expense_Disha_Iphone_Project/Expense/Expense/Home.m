//
//  Home.m
//  Expense
//
//  Created by mac on 2/10/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "Home.h"
#import "DbOperation.h"

#define getIncome() [[NSUserDefaults standardUserDefaults] objectForKey:@"income"]


@interface Home ()

@end

@implementation Home
@synthesize setBtn;

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
    
    
    DbOperation *DB=[[DbOperation alloc]init];
    NSMutableArray* SelData=[DB selectTrans];
    
    NSLog(@"%@",SelData);
    
    int exp = 0;
    int income = [getIncome() intValue];
    
    for (NSDictionary *dict in SelData)
    {
        exp += [[dict objectForKey:@"PRICE"] integerValue];
    }
    
    self.BalanceVal.text = [NSString stringWithFormat:@"%d",income - exp];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isClientLogin"])
    {
        setBtn.hidden = NO;
        
    }
    else
    {
        setBtn.hidden = YES;
    }
    
    
    // Do any additional setup after loading the view.
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

- (IBAction)AddTrans:(id)sender {
    
}

- (IBAction)History:(id)sender {
}


- (IBAction)Setting:(id)sender {
}

- (IBAction)Reminder:(id)sender {
}
@end
