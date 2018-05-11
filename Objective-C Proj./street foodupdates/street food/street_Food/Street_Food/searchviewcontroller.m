//
//  searchviewcontroller.m
//  Street_Food
//
//  Created by Tops on 9/9/16.
//  Copyright © 2016 pinu. All rights reserved.
//

#import "searchviewcontroller.h"
#import "homepageviewcontroller.h"
#import "home_pageviewcontroller.h"
#import "CollectionViewCell.h"
#import "detailhomepageviewcontroller.h"
#import "mapviewcontroller.h"
#import "categoriesviewcontroller.h"
#import "maindetailviewcontroller.h"

@interface searchviewcontroller ()
{
    NSMutableArray *arrSearchResult;
}
@property (weak, nonatomic) IBOutlet UICollectionView *resultCollection;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;

@end

@implementation searchviewcontroller
@synthesize txt_search,arrname,arrdata;
@synthesize description,defaultConfigObject,defaultSession,urlRequest,params,urlstring,dataTask;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    arrSearchResult = [[NSMutableArray alloc]init];
    [_resultCollection reloadData];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    //Start Code
    arrSearchResult = [[NSMutableArray alloc]init];
    [_resultCollection reloadData];
    defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //*url = [NSURL URLWithString:@"http://studentzone.16mb.com/selectCat.php"];
    
    urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://studentzone.16mb.com/select.php"]];
    //
    //params = [NSString stringWithFormat:@"Query=Select * from tblplace where PlaceName like '%%%@%%' or ShopName like '%%%@%%' or CatName  like '%%%@%%'",searchBar.text,searchBar.text,searchBar.text];
    NSString *qty=[searchBar.text lowercaseString];
    params = [NSString stringWithFormat:@"Query=Select * from tblplace where PlaceName like '%%%@%%' or ShopName like '%%%@%%' or CatName  like '%%%@%%'",qty,qty,qty];
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
                                        
                                        arrSearchResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        if(arrSearchResult.count==0)
                                        {
                                            //lblToppl.text = @"No Places Found";
                                            _lblStatus.text = @"No Places Found!";
                                        }
                                        else{
                                            _lblStatus.text = [NSString stringWithFormat:@"Total %lu Places Found",(unsigned long)arrSearchResult.count];
                                        }
                                        
                                        [_resultCollection reloadData];
                                    }
                                }];
    
    [dataTask resume];
    
    

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * imgw = [UIImage imageNamed:@"woodenpizza.jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imgw]];
//    -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//    {
//        [self.view endEditing:YES];
//    }
    //-(void) touches

    
    
    arrdata = [[NSArray alloc]initWithObjects:@"f1.png",@"area.png",@"hut.png", @"nearbyme.png",nil];
    arrname = [[NSArray alloc]initWithObjects:@"Food",@"Area",@"Place",@"Nearby Me",nil];

    }
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    
//    if(indexPath.section == 0)
//    {
//        if (indexPath.row == 0)
//        {
//            categoriesviewcontroller *categoriespage =[self.storyboard instantiateViewControllerWithIdentifier:@"categoriespage"];
//            [self.navigationController pushViewController:categoriespage animated:YES];
//
//        }
//        else if (indexPath.row ==1)
//        {
//            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
//            [self.navigationController pushViewController:deatailhomepage animated:YES];
//        }
//        else if (indexPath.row ==2)
//        {
//            detailhomepageviewcontroller *deatailhomepage =[self.storyboard instantiateViewControllerWithIdentifier:@"detailhomepage"];
//            [self.navigationController pushViewController:deatailhomepage animated:YES];        }
//            }
//        else if (indexPath.row ==3)
//        {
//            mapviewcontroller *mapviewpage =[self.storyboard instantiateViewControllerWithIdentifier:@"mapviewpage"];
//            [self.navigationController pushViewController:mapviewpage animated:YES];
//
//        }
    maindetailviewcontroller *maindetailpage =[self.storyboard instantiateViewControllerWithIdentifier:@"maindetailpage"];
    maindetailpage.arrPlaceDetails = [arrSearchResult objectAtIndex:indexPath.item];
    [self.navigationController pushViewController:maindetailpage animated:YES];
}








- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrSearchResult.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    dispatch_async(backgroundQueue123(), ^{
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://studentzone.16mb.com/uploads/%@",[[arrSearchResult objectAtIndex:indexPath.item] objectForKey:@"imageUrl"]]];
        
        UIImage *img =[self downloadimg:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [cell.image_view setImage:img];
            
            
        });
        
        
    });

   // [cell.image_view setImage:[UIImage imageNamed:[arrSearchResult objectAtIndex:indexPath.row]]];
    [cell.lbl_catname setText:[[arrSearchResult objectAtIndex:indexPath.item] objectForKey:@"CatName"]];
    
    
    return cell;
}

dispatch_queue_t backgroundQueue123() {
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    txt_search.layer.cornerRadius = 5.0;
    txt_search .clipsToBounds = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_searchaction:(id)sender {
}
- (IBAction)btn_backsearchh:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
