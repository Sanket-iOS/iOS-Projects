//
//  maindetailviewcontroller.m
//  Street_Food
//
//  Created by Jaina Bhavsar on 08/07/1938 Saka.
//  Copyright © 1938 Saka pinu. All rights reserved.
//

#import "maindetailviewcontroller.h"
#import "maindetailviewcell.h"

#import "maindetail2viewcell.h"
#import "AppDelegate.h"

@interface maindetailviewcontroller ()
{
    NSMutableArray *arrAllData, *arrCatData, *arrC, *arrCat;
    NSMutableArray *commentArr;
    int r;
    int i;
    AppDelegate *appDel;
}
@property (weak, nonatomic) IBOutlet UICollectionView *otherImageCollection;
@property (weak, nonatomic) IBOutlet UITextView *spTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imgMain;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *lblAddress;
@property (weak, nonatomic) IBOutlet UITableView *tblComment;
@property (weak, nonatomic) IBOutlet UITextView *txtComment;
@end


@implementation maindetailviewcontroller


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btnAddCommentAction:(id)sender {
}
@synthesize arrdata,arrname,blur_view,btn5,btn4,btn3,btn2,btn1,scrl_view,table_view1,arr1;
@synthesize arrPlaceDetails;

@synthesize description,defaultConfigObject,defaultSession,urlRequest,params,urlstring,dataTask;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _lblTitle.text = [self.arrPlaceDetails objectForKey:@"PlaceName"];
    _spTextView.text = [self.arrPlaceDetails objectForKey:@"Specialities"];
    _lblAddress.text = [self.arrPlaceDetails objectForKey:@"Address"];
    table_view1.backgroundColor = [UIColor clearColor];
    
    int ra = [[self.arrPlaceDetails objectForKey:@"sRate"] intValue];
   
    UIImage *imgh;
    switch (ra) {
        case 1:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            btn2.imageView.image= btn3.imageView.image= btn4.imageView.image= btn5.imageView.image=imgh;
            btn1.imageView.image = [UIImage imageNamed:@"heartfill.png"];
            break;
        case 2:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            btn1.imageView.image=btn2.imageView.image= imgh;
            btn5.imageView.image = [UIImage imageNamed:@"heartblank.png"];
            btn4.imageView.image = [UIImage imageNamed:@"heartblank.png"];
            btn3.imageView.image = [UIImage imageNamed:@"heartblank.png"];
            break;
        case 3:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
            btn1.imageView.image=btn2.imageView.image= btn3.imageView.image=imgh;
            btn5.imageView.image = [UIImage imageNamed:@"heartblank.png"];
            btn4.imageView.image = [UIImage imageNamed:@"heartblank.png"];

            break;
        case 4:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            
           
            
            btn1.imageView.image=btn2.imageView.image= btn3.imageView.image= btn4.imageView.image= imgh;
            btn5.imageView.image = [UIImage imageNamed:@"heartblank.png"];

            break;
        case 5:
            
             imgh = [UIImage imageNamed:@"heartfill.png"];
            btn1.imageView.image=btn2.imageView.image= btn3.imageView.image= btn4.imageView.image= btn5.imageView.image=imgh;
            //btn1.imageView.image = [UIImage imageNamed:@"heartfill.png"];
            break;
            
        default:
            imgh = [UIImage imageNamed:@"heartblank.png"];//heartfill.png
            btn1.imageView.image=btn2.imageView.image= btn3.imageView.image= btn4.imageView.image= btn5.imageView.image=imgh;

            break;
    }

    
    dispatch_async(backgroundQueue3(), ^{
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[self.arrPlaceDetails objectForKey:@"imageUrl"]]];
        
        UIImage *img =[self downloadimg:url];
        NSLog(@"%@",img);
        dispatch_async(dispatch_get_main_queue(), ^{
            //[cell.actLoad startAnimating];
            [_imgMain setImage:img];
            //[cell.actLoad stopAnimating];
            
        });
        
        
    });
    

    
    appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //appDel.userEmailID = [[statusUser objectAtIndex:0]objectForKey:@"emailid"];

    // Do any additional setup after loading the view.
    
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
    params =[NSString stringWithFormat:@"Query=select * from tblplace where CatName='%@'",[arrPlaceDetails objectForKey:@"CatName"]];
    //
    [urlRequest setHTTPMethod:@"POST"];
    //
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    //
    
    
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    _responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        arrAllData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        [_otherImageCollection reloadData];
                                    }
                                }];
    
    [dataTask resume];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
    params =[NSString stringWithFormat:@"Query=select * from tblcomment where onplaceid=%@",[arrPlaceDetails objectForKey:@"placeid"]];
    //
    [urlRequest setHTTPMethod:@"POST"];
    //
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    //
    
    
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    _responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        commentArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        [_tblComment reloadData];
                                    }
                                }];
    
    [dataTask resume];

    
    
    
    
    //NSLog(@"\n\n%@\n\n",arrAllData);
    //end code
    //w//h//
    scrl_view.contentSize = CGSizeMake(320, 780);
    blur_view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.10];
    blur_view.clipsToBounds = YES;
    blur_view.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f].CGColor;
    blur_view.layer.borderWidth = 1.0;
    blur_view.layer.cornerRadius = 6.0;
    
    arrdata = [[NSArray alloc]initWithObjects:@"caloopauva.jpg",@"cchiness.jpg",@"cpunjabi.jpg",@"cidli.jpg",@"csnack1.jpg",@"cmocktail.jpg",@"ccoffee.jpg",@"cicecream.jpeg", nil];


    arrname = [[NSArray alloc]initWithObjects:@"Breakfast",@"Chiness",@"Punjabi",@"South Indian ",@"Snacks",@"Mocktails", @"Coffee/Tea Zone",@"Ice-Cream",nil];
    
    
    //tableview
    
    arr1 = [[NSArray alloc]initWithObjects:@"Breakfast",@"Chiness",@"Punjabi",@"South Indian ",@"Snacks",@"Mocktails", @"Coffee/Tea Zone",@"Ice-Cream",nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrAllData count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if(collectionView.tag==1)
//    {
//    maindetailviewcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//        cell.lbl_speciality.text = [arrname objectAtIndex:indexPath.row];
//        [cell.lbl_speciality setFont:[UIFont fontWithName:@"" size:15.0f]];
//        return cell;
//    }
//    else{
//        
//        maindetail2viewcell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
//    [cell1.img_view2 setImage:[UIImage imageNamed:[arrdata objectAtIndex:indexPath.row]]];
//        return cell1;
//    }
    
    
     maindetail2viewcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    dispatch_async(backgroundQueue3(), ^{
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[arrAllData objectAtIndex:indexPath.section] objectForKey:@"imageUrl"]]];
        
        UIImage *img =[self downloadimg:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //[cell.actLoad startAnimating];
            [cell.img_view2 setImage:img];
            //[cell.actLoad stopAnimating];
            
        });
        
        
    });

    return cell;
    
}

//table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(commentArr.count==0){
        return 1;
    }
       return [commentArr count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if(commentArr.count==0)
    {
        
        cell.textLabel.text = @"0 Comments!";//[[commentArr objectAtIndex:indexPath.section] objectForKey:@"comment"];
        
    }
    else{
    cell.textLabel.text = [[commentArr objectAtIndex:indexPath.section] objectForKey:@"comment"];
    
    cell.detailTextLabel.text = [[commentArr objectAtIndex:indexPath.section] objectForKey:@"commentBy"];
    }
    return cell;
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

- (IBAction)btn_back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn_heart5:(id)sender
{
    UIButton *btn = (UIButton *) sender;
    [btn1 setImage:[UIImage imageNamed:@"heartblank"] forState:UIControlStateNormal];
    
    [btn2 setImage:[UIImage imageNamed:@"heartblank"] forState:UIControlStateNormal];
    
    [btn3 setImage:[UIImage imageNamed:@"heartblank"] forState:UIControlStateNormal];
    
    [btn4 setImage:[UIImage imageNamed:@"heartblank"] forState:UIControlStateNormal];
    
    [btn5 setImage:[UIImage imageNamed:@"heartblank"] forState:UIControlStateNormal];
    
    if(btn==btn1)
    {
        [btn1 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        r=1;
    }
    else if(btn==btn2)
    {
        
        [btn1 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn2 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        r=2;
        
    }
    else if(btn==btn3)
    {
        
        [btn1 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn3 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        r=3;
        
    }
    else if(btn==btn4)
    {
        
        [btn1 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn3 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn4 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        r=4;
        
        
    }
    else if(btn==btn5)
    {
        
        [btn1 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn3 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn4 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        [btn5 setImage:[UIImage imageNamed:@"heartfill"] forState:UIControlStateNormal];
        
        r=5;
    }

    
}
- (IBAction)btn_addcomment:(id)sender {
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSLog(@"%@", app.ChkSkip);
    if (app.ChkSkip.length==0) {
        
    
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
        params =[NSString stringWithFormat:@"Query=INSERT INTO tblcomment(commentBy, comment, commentDate, onplaceid,r) VALUES ('%@','%@','%@',%@,%d)&Action=select avg(r) as rate from tblcomment where onplaceid =%@&pid=%@",appDel.userEmailID,_txtComment.text,[NSDate date],[arrPlaceDetails objectForKey:@"placeid"],r,[arrPlaceDetails objectForKey:@"placeid"],[arrPlaceDetails objectForKey:@"placeid"]];
    //
    [urlRequest setHTTPMethod:@"POST"];
    //
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    //
    
    
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    _responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        commentArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        [_tblComment reloadData];
                                    }
                                }];
    
    [dataTask resume];
    //[self Addrate];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message:@"Plz Login" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
    }

}


dispatch_queue_t backgroundQueue3() {
    static dispatch_once_t queueCreationGuard;
    static dispatch_queue_t queue;
    dispatch_once(&queueCreationGuard, ^{
        queue = dispatch_queue_create("com.something.myapp.backgroundQueue", DISPATCH_QUEUE_SERIAL);
    });
    return queue;
}

-(UIImage *)downloadimg:(NSURL *)url
{
    NSData *dt =[NSData dataWithContentsOfURL:url
                 ];
    UIImage *img =[UIImage imageWithData:dt
                   ];
    return img;
    
    
}


- (IBAction)btnrat:(id)sender {
    
    if (i!=0) {
        i=i+1;
        if (i==0) {
            i=1;
        }
    }
    else
    {
        i=i+1;
    }
    
    //NSString *str;
    self.lblrt.text=[[NSString alloc]initWithFormat:@"rating%d",i];
    
   
    
    
}
-(void)Addrate
{
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/rating.php"]];
    //
    //NSString *nm=@"tops";
    //params =[NSString stringWithFormat:@"Query1=INSERT INTO tblplace(sRate) VALUES (%d)",i];
    params =[NSString stringWithFormat:@"Query1=update tblplace set sRate = %d where CatName='%@'",i,[arrPlaceDetails objectForKey:@"CatName"]];

    
    NSLog(@"%@",params);
    [urlRequest setHTTPMethod:@"POST"];
    //
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    //
    
    
    
    dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                    _responsedata = data;
                                    NSLog(@"Response:%@ %@\n", response, error);
                                    if(error == nil)
                                    {
                                        NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                        NSLog(@"Data = %@",text);
                                        
                                        commentArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        [_tblComment reloadData];
                                    }
                                }];
    
    [dataTask resume];
    
    

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [_txtComment resignFirstResponder];
       
    }
    return YES;
}
@end
