//
//  showNotesViewController.m
//  SqliteDesigning
//
//  Created by mac on 3/18/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "showNotesViewController.h"
#import "DBmanger.h"

@interface showNotesViewController ()

@end

@implementation showNotesViewController
@synthesize show_notes,Login_id,note_title,title_arr,title_id,notes_arr,str;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"engineering college,gandhinagar";
    
     self.view.backgroundColor=[UIColor clearColor];    
    
    show_notes.backgroundColor=[UIColor clearColor];
    
    
    
    DBmanger *dbm=[[DBmanger alloc]init];
    
    [dbm DMLOperation:@"select * from profileinformation"];
    
    
    NSString *query1=[[NSString alloc]initWithFormat:@"select notes from notesinformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
    
    notes_arr=[[NSMutableArray alloc]init];
    
    
    
   if(![str isEqualToString:@"edit"])
   {
    
   if(![title_id isEqual:nil])
    {
    
    note_title.text=[title_arr objectAtIndex:[title_id intValue]];
    
        
    //NSString *query1=[[NSString alloc]initWithFormat:@"select notes from notealarminformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
    
    notes_arr=[dbm DMLOpertion_detailArr:query1];
   
    notes_arr=[[[notes_arr reverseObjectEnumerator]allObjects]mutableCopy];
        
    show_notes.text=[notes_arr objectAtIndex:[title_id intValue]];
    }
        
    }
    // Do any additional setup after loading the view.
}

- (IBAction)save_notes:(id)sender
{
    DBmanger *dbm=[[DBmanger alloc]init];
    [dbm DMLOperation:@"select * from profileinformation"];
    
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString=[dateFormat stringFromDate:date];
    NSLog(@"%@",dateString);
    

    
    
    if([str isEqualToString:@"edit"])
    {

    
    NSString *query=[[NSString alloc]initWithFormat:@"insert into notesinformation (Enno,notes,Title,date) values ('%@','%@','%@','%@')",[dbm.en_arr objectAtIndex:[Login_id intValue]],show_notes.text,note_title.text,dateString];
    
    [dbm DMLOperation:query];
        
    }
    
    else
    {
        NSString *query=[[NSString alloc]initWithFormat:@"select rowid from notesinformation where Enno='%@'",[dbm.en_arr objectAtIndex:[Login_id intValue]]];
        
        NSArray *rowid=[[NSArray alloc]init];
        
        rowid=[dbm DMLOpertion_detailArr:query];
        
        rowid=[[[rowid reverseObjectEnumerator]allObjects]mutableCopy];
        
        NSNumber *select_id=[rowid objectAtIndex:[title_id intValue]];
        
        NSString *query1=[[NSString alloc]initWithFormat:@"update notesinformation set notes='%@',Title='%@', date='%@' where rowid='%d'",show_notes.text,note_title.text,dateString,[select_id intValue]] ;
        
        [dbm DMLOperation:query1];
        
    }
   
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
