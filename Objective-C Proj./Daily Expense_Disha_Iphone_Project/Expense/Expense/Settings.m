//
//  Settings.m
//  Expense
//
//  Created by tops on 2/24/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "Settings.h"
#import "DbOperation.h"


#define setCurrency(v) [[NSUserDefaults standardUserDefaults] setObject:v forKey:@"currencyType"];
#define getCurrency() [[NSUserDefaults standardUserDefaults] objectForKey:@"currencyType"];

#define setDateFormat(v) [[NSUserDefaults standardUserDefaults] setObject:v forKey:@"dateFormat"];
#define getDateFormat() [[NSUserDefaults standardUserDefaults] objectForKey:@"dateFormat"];


@interface Settings ()

@end

@implementation Settings
@synthesize Radio1Button,Radio2Button,CurrecyBox,DateFormateMessage,cidBOX,CNameBox;


NSString *msg;
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
    
    
    Currency=[[NSArray alloc]initWithObjects:@"Rupee ￼Rs.",@"Dollar $",@"Euro €",@"Yen ¥",@"Pounds £",@"Swiss franc Fr",@"Lev лв",@"Kyat Ks",@"Riel ៛",@"Ruble р.",@"afghani ؋ ",@"Lek L",@"dinar د.ج",@"Forint ƒ",@"Ngultrum Nu.",@"Birr Br",@"Won ₩",@"Kip ₭",  nil];
    
    CurrencyCodes = [NSArray arrayWithObjects:@"INR",@"USD",@"EUR",@"JPY",@"EGP",@"CHF",@"BGN",@"MMK",@"KHR",@"BYR",@"AFN",@"ALL",@"BHD",@"HUF",@"BTN",@"ETB",@"KPW",@"LAK", nil];
    
    
    NSString *currentType = getCurrency();
    if (currentType.length > 0)
    {
        NSUInteger ind = [CurrencyCodes indexOfObject:currentType];
        
        CurrecyBox.text = [Currency objectAtIndex:ind];
        
    }
    
    NSString *dateformat = getDateFormat();
    
    if ([dateformat isEqualToString:@"dd/MM/yyyy"])
    {
        [Radio1Button  setImage:[UIImage imageNamed:@"Radio.png"] forState:UIControlStateNormal];
        [Radio2Button  setImage:[UIImage imageNamed:@"selctedradio.png"] forState:UIControlStateNormal];
    }
    else
    {
        
        
        [Radio1Button  setImage:[UIImage imageNamed:@"selctedradio.png"] forState:UIControlStateNormal];
        [Radio2Button  setImage:[UIImage imageNamed:@"Radio.png"] forState:UIControlStateNormal];
        
    }
    
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Currency.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[CurrencyTable dequeueReusableCellWithIdentifier:@"cell1" ];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
    }
    
    cell.textLabel.text=[Currency objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CurrecyBox.text=[Currency objectAtIndex:indexPath.row];
    [CurrencyTable removeFromSuperview];
    CurrencyTable=nil;
    
    setCurrency([CurrencyCodes objectAtIndex:indexPath.row]);
    
}

- (IBAction)Radio1Click:(id)sender {
    
    if([Radio1Button.currentImage isEqual:[UIImage imageNamed:@"Radio.png"]])
    {
        if(![Radio2Button.currentImage isEqual:[UIImage imageNamed:@"selctedradio.png"]])
        {
            [sender  setImage:[UIImage imageNamed:@"selctedradio.png"] forState:UIControlStateNormal];
            msg=@"mm/dd/yyyy was a set Date Formate.";
            DateFormateMessage.hidden=NO;
            DateFormateMessage.text=msg;
            
            setDateFormat(@"MM/dd/yyyy");
            
        }
    }
    else
    {
        [sender setImage:[UIImage imageNamed: @"Radio.png"] forState:UIControlStateNormal];
        DateFormateMessage.hidden=YES;
        
    }
    
}

- (IBAction)Radio2Click:(id)sender {
    
    
    
    if([Radio2Button.currentImage isEqual:[UIImage imageNamed:@"Radio.png"]])
    {
        if(![Radio1Button.currentImage isEqual:[UIImage imageNamed:@"selctedradio.png"]])
        {
            [sender setImage:[UIImage imageNamed: @"selctedradio.png"] forState:UIControlStateNormal];
            DateFormateMessage.hidden=NO;
            msg=@"dd/mm/yyyy was a set Date Formate.";
            
            setDateFormat(@"dd/MM/yyyy");
        }
    }
    else
    {
        [sender  setImage:[UIImage imageNamed: @"Radio.png"] forState:UIControlStateNormal];
        DateFormateMessage.hidden=YES;
        
    }
    DateFormateMessage.text=msg;
}
- (IBAction)SelectCuurencyClick:(id)sender {
    if (CurrencyTable==NULL) {
        
        CurrencyTable=[[UITableView alloc]initWithFrame:CGRectMake(10, 100, 300, 200)
                                                  style:UITableViewStylePlain];
        CurrencyTable.delegate=self;
        CurrencyTable.dataSource=self;
        [self.view addSubview:CurrencyTable];
        
    }
    
}
- (IBAction)AddCategory:(id)sender {
  
    DateFormateMessage.hidden=NO;
    
    DbOperation *db=[[DbOperation alloc]init];
    NSString *insQry=[[NSString alloc]initWithFormat:@"insert into Category(Category) Values('%@')",CNameBox.text ];
    BOOL Result=[db DMLOperation:insQry];
    NSString *ss;
    if(Result)
        ss=@"insert Category";
    else
        ss=@"not insert";
    self.DateFormateMessage.text=ss;
    cidBOX.text=nil;
    CNameBox.text=nil;
}

- (IBAction)EditCategory:(id)sender {
 
    DateFormateMessage.hidden=NO;
    NSString *cid=cidBOX.text;
    DbOperation *db=[[DbOperation alloc]init];
    NSString *updQRY=[[NSString alloc]initWithFormat:@"update Category set Category='%@' where Cid='%@'",CNameBox.text,cid];
    BOOL upd=[db DMLOperation:updQRY];
    NSString *gtr;
    if(upd)
        gtr=@"Update Category";
    else
        gtr=@"Don't Update Category";
    DateFormateMessage.text=gtr;
    cidBOX.text=nil;
    CNameBox.text=nil;
}

- (IBAction)DeleteCategory:(id)sender {
    DbOperation *db=[[DbOperation alloc]init];
    
    DateFormateMessage.hidden=NO;
  
    int cid=[cidBOX.text intValue];
    NSString *delQry=[[NSString alloc]initWithFormat:@"delete from CateGory where Cid=%d",cid ];
    ArrCategory=[db selectCategory];
    BOOL r=[db DMLOperation:delQry];
   if(r)
       DateFormateMessage.text=@"Delete Category";
    else
        DateFormateMessage.text=@"Not Delete";
    cidBOX.text=nil;
    CNameBox.text=nil;
}
@end
