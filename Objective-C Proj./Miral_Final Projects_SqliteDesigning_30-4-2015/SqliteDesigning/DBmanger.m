//
//  DBmanger.m
//  SqliteDesigning
//
//  Created by tops on 3/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "DBmanger.h"

@implementation DBmanger
@synthesize strDB,en_arr,pwd_arr,name_arr,sem_arr,mobile_arr,email_arr,branch_arr,detail_arr;

-(id)init
{
    if(self==[super init])
    {
        appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        strDB=[[NSString alloc]initWithString:appDel.strDBPath];
    }
    return self;
}

-(void)DMLOperation:(NSString *)query
{
    //BOOL result=NO;
    en_arr=[[NSMutableArray alloc]init];
    pwd_arr=[[NSMutableArray alloc]init];
    name_arr=[[NSMutableArray alloc]init];
    sem_arr=[[NSMutableArray alloc]init];
    branch_arr=[[NSMutableArray alloc]init];
    mobile_arr=[[NSMutableArray alloc]init];
    email_arr=[[NSMutableArray alloc]init];
    
    if(sqlite3_open([strDB UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            while (sqlite3_step(statment)==SQLITE_ROW)
            {
                NSString *en_no=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment, 0)];
               
                NSString *name=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment, 1)];
                
                NSString *sem=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment, 2)];
                
                NSString *branch=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment,3)];
                
                NSString *mbl=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment,4)];
                
                 NSString *email=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment,5)];
                
                NSString *pwd=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment,6)];
               
                [en_arr addObject:en_no];
                [pwd_arr addObject:pwd];
                [name_arr addObject:name];
                [sem_arr addObject:sem];
                [branch_arr addObject:branch];
                [mobile_arr addObject:mbl];
                [email_arr addObject:email];
                
            }
           // result=YES;
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
   // return result;
}

-(NSString *)DMLOpertion_other:(NSString *)query
{
    NSString *branchID=[[NSString alloc]init];
    
    if(sqlite3_open([strDB UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            if(sqlite3_step(statment)==SQLITE_ROW)
            {
                branchID=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment, 0)];
               
            }
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
  

    
    return branchID;
    
}

-(void)DMLOpertion_update:(NSString *)query
{
    
    if(sqlite3_open([strDB UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            sqlite3_step(statment);
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    
}

-(NSMutableArray *)DMLOpertion_detailArr:(NSString *)query
{
    detail_arr=[[NSMutableArray alloc]init];
    if(sqlite3_open([strDB UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        NSLog(@"%@",query);
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            while(sqlite3_step(statment)==SQLITE_ROW)
            {
                NSString *get_data=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statment, 0)];
                [detail_arr addObject:get_data];
                
            }
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    
    return detail_arr;
    
    
}

@end
