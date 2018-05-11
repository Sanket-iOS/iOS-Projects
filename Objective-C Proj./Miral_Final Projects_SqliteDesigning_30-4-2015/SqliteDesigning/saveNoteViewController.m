//
//  saveNoteViewController.m
//  SqliteDesigning
//
//  Created by mac on 3/18/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "saveNoteViewController.h"
#import "showNotesViewController.h"
#import "DBmanger.h"

@interface saveNoteViewController ()

@end

@implementation saveNoteViewController
@synthesize  Login_id,title_arr,note_tableview,tableview,date_arr;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.view.backgroundColor=[UIColor clearColor];    
   
    self.navigationItem.title=@"engineering college,gandhinagar";
    
    self.tableview.backgroundColor = [UIColor clearColor];
   

}


-(void)viewWillAppear:(BOOL)animated
{
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    
    NSString *query=[[NSString alloc]initWithFormat:@"select Title from notesinformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
    
    
    
    title_arr=[[NSMutableArray alloc]init];
    
    title_arr=[dbm DMLOpertion_detailArr:query];
    
    title_arr=[[[title_arr reverseObjectEnumerator]allObjects]mutableCopy];
    
    NSString *query1=[[NSString alloc]initWithFormat:@"select date from notesinformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
    
    date_arr=[[NSMutableArray alloc]init];
    
    date_arr=[dbm DMLOpertion_detailArr:query1];
    
    date_arr=[[[date_arr reverseObjectEnumerator]allObjects]mutableCopy];
    
    [note_tableview reloadData];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    NSLog(@"%lu",(unsigned long)[title_arr count]);
    return [title_arr count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mycell"];
    }

    cell.textLabel.text=[title_arr objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[date_arr objectAtIndex:indexPath.row];
    cell.backgroundColor =  [UIColor clearColor];
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    showNotesViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"show"];
    
    svc.title_id=[[NSNumber alloc]initWithInteger:indexPath.row];
  
    svc.Login_id=Login_id;
    
    svc.title_arr=title_arr;
    
    [self.navigationController pushViewController:svc animated:YES];
    
    
    
    
}
- (IBAction)edit_note:(id)sender
{
    showNotesViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"show"];
    
    svc.Login_id=Login_id;
    
    NSString *str=@"edit";
    
    svc.str=str;
    
    [self.navigationController pushViewController:svc animated:YES];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    if(editingStyle==UITableViewCellEditingStyleDelete)
        
    {
        NSString *query=[[NSString alloc]initWithFormat:@"select rowid from notesinformation where Enno='%@' and Title='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]],[title_arr objectAtIndex:indexPath.row]];
        
        
        
        NSArray *rowid=[[NSArray alloc]init];
        
        rowid=[dbm DMLOpertion_detailArr:query];
        
        
        
        NSString *query1=[[NSString alloc]initWithFormat:@"delete from notesinformation where rowid='%@'",[rowid objectAtIndex:0]] ;
        
        [dbm DMLOperation:query1];
        
        
        DBmanger *dbm=[[DBmanger alloc]init];
        [dbm DMLOperation:@"select * from profileinformation"];
        
        
        NSString *queryss=[[NSString alloc]initWithFormat:@"select Title from notesinformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
        
        title_arr=[[NSMutableArray alloc]init];
        
        title_arr=[dbm DMLOpertion_detailArr:queryss];
        
        title_arr=[[[title_arr reverseObjectEnumerator]allObjects]mutableCopy];
        
       
        [note_tableview reloadData];
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
