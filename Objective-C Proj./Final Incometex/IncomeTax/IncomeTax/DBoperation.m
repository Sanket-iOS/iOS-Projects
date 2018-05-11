//
//  DBoperation.m
//  IncomeTax
//
//  Created by tops on 3/25/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "DBoperation.h"

@implementation DBoperation
@synthesize strDBMnem;
-(id)init
{
    if (self=[super init]) {
        appdel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        self.strDBMnem=[[NSString alloc]initWithString:appdel.DBPath];
    }
    return self;
}



-(BOOL)DMLOpearion:(NSString *)query
{
    BOOL result=false;
    if (sqlite3_open([strDBMnem UTF8String], &Database)==SQLITE_OK) {
        sqlite3_stmt *complistmt;
        //NSLog(@"%@",query);
        if (sqlite3_prepare_v2(Database, [query UTF8String], -1, &complistmt, nil)==SQLITE_OK) {
            sqlite3_step(complistmt);
            result=true;
        }
        sqlite3_finalize(complistmt);
        
    }
    sqlite3_close(Database);
    return result;
}
-(NSString *)userlogin:(NSString *)str
{
    NSString *data=[[NSString alloc]init];
    if (sqlite3_open([strDBMnem UTF8String], &Database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        NSLog(@"%@",str);
        
        if (sqlite3_prepare_v2(Database, [str UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW) {
                data=[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                
                
                
                
            }
        }
        
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(Database);
    return data;
    
}
-(NSMutableArray *)SelectId:(NSString *)Query
{
    NSLog(@"%@",Query);
    NSMutableArray *mutarr=[[NSMutableArray alloc]init];
    if (sqlite3_open([strDBMnem UTF8String],&Database)==SQLITE_OK)
    {
        sqlite3_stmt *comtm;
        if(sqlite3_prepare_v2(Database,[Query UTF8String], -1, &comtm, nil)==SQLITE_OK)
        {
            while (sqlite3_step(comtm)==SQLITE_ROW)
            {
                NSString *ids=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(comtm, 0)];
                [mutarr addObject:ids];
                
            }
        }
        sqlite3_finalize(comtm);
    }
    sqlite3_close(Database);
    return mutarr;
    
}


@end
