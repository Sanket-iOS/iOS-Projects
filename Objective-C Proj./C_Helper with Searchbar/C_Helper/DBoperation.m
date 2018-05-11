//
//  DBoperation.m
//  C_Helper
//
//  Created by mac on 4/1/15.
//  Copyright (c) 2015 ratan. All rights reserved.
//

#import "DBoperation.h"

#import <sqlite3.h>

@implementation DBoperation


-(id)init
{

    [self CopyandPestData];
    return self;
}

-(NSString*)DocumentDirectry
{
    NSString *home=NSHomeDirectory();
    NSString *strpath=[home stringByAppendingPathComponent:@"Documents"];
  //  NSLog(@"%@",strpath);
    return strpath;
}

-(void)CopyandPestData
{
    NSString *strFormpath=[[NSBundle mainBundle]pathForResource:@"C_helper" ofType:@"db"];
    NSString *strTopath=[[self DocumentDirectry]stringByAppendingPathComponent:@"C_helper.db"];

    NSFileManager *Maneger=[NSFileManager defaultManager];
    if (![Maneger fileExistsAtPath:strTopath]) {
        [Maneger copyItemAtPath:strFormpath toPath:strTopath error:nil];
    }
    
    
}


-(NSMutableArray *)Selectuser
{

    NSString *strQuery=@"select * from Cflist";
    NSString *strDatabaseFile=[[self DocumentDirectry] stringByAppendingPathComponent:@"C_helper.db"];
   // NSLog(@"%@",strDatabaseFile);
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database,[strQuery UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                NSString *Fname=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statments, 1)];
                
                
                [arrItems addObject:Fname];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
}

@end
