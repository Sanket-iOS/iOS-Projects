//
//  DBHandler.m
//  Myproject
//
//  Created by mac on 2/19/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import "DBHandler.h"
#import <sqlite3.h>
@implementation DBHandler
-(instancetype)init
{
    [self copyAndPasteDatabase];
    return self;
}

-(BOOL)DMLOperations:(NSString*)query
{
    NSString *databaseFilePath=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"shopingapp.sqlite"];
    sqlite3 *database;
    BOOL status=NO;
    
    if( sqlite3_open([databaseFilePath UTF8String] ,&database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            sqlite3_step(statments);
            status=YES;
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  status;
}

-(NSArray*)SelectStudents:(NSString *)query
{
    NSString *databaseFilePath=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"shopingapp.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    
    if( sqlite3_open([databaseFilePath UTF8String] ,&database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if( sqlite3_prepare_v2(database, [query UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while ( sqlite3_step(statments)==SQLITE_ROW)
            {
                NSString *firstname=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 0) encoding:NSUTF8StringEncoding];
                NSString *lastname=[NSString stringWithCString:(char*)sqlite3_column_text(statments,1) encoding:NSUTF8StringEncoding];
                NSString *address=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 2) encoding:NSUTF8StringEncoding];
                NSString *city=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 3) encoding:NSUTF8StringEncoding];
                NSString *country=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 4) encoding:NSUTF8StringEncoding];
                int pincode=sqlite3_column_int(statments, 5);
                int mobileno=sqlite3_column_int(statments, 6);                NSString *EmailID=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 7) encoding:NSUTF8StringEncoding];
                NSString *Password=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 8) encoding:NSUTF8StringEncoding] ;
                NSString *conformPassword=[NSString stringWithCString:(char*)sqlite3_column_text(statments, 9) encoding:NSUTF8StringEncoding] ;
                NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:firstname,@"First_Name",lastname,@"Last_Name",address,@"Address",city,@"City",country,@"Country",pincode,@"Pincode",mobileno,@"Mobileno",EmailID,@"EmailID",Password,@"Password",conformPassword,@"Conform_Password", nil];
                [arrItems addObject:dic];
            }
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
}

-(void)copyAndPasteDatabase
{
    NSString *fromPath=[[NSBundle mainBundle] pathForResource:@"shopingapp" ofType:@"sqlite"];
    NSString *toPath=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"shopingapp.sqlite"];
    NSLog(@"%@",toPath);
    NSFileManager *manager=[NSFileManager defaultManager];
    
    if(![manager fileExistsAtPath:toPath])
    {
        [manager copyItemAtPath:fromPath toPath:toPath error:nil];
    }
}
-(NSString*)DocumentDirectoryPath
{
    NSString *strHome=NSHomeDirectory();
    return  [strHome stringByAppendingPathComponent:@"Documents"];
}
@end
