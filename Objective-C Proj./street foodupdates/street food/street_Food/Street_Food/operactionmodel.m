//
//  operactionmodel.m
//  project
//
//  Created by kajal on 27/09/16.
//  Copyright © 2016 Priyal Shah. All rights reserved.
//

#import "operactionmodel.h"


@implementation operactionmodel

-(id)init
{
    
    if([super init]!=nil)
    {
    
        appDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        strDbPath = appDel.databasePath;
        NSLog(@"%@",strDbPath);
    }
    
    
    return self;
}

-(BOOL)CommandMethod:(NSString *)strQuery{
    
    BOOL isDone = false;
    
    if( sqlite3_open([strDbPath UTF8String], &dbObj) ==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(dbObj, [strQuery UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            sqlite3_step(statment);
            isDone=true;
            sqlite3_finalize(statment);
        }
        sqlite3_close(dbObj);
    }
    
    
    return isDone;
    
    
}

-(NSMutableArray *)SelectData:(NSString *)strQuery{
    
    arrData = [[NSMutableArray alloc]init];
    if( sqlite3_open([strDbPath UTF8String], &dbObj) ==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(dbObj, [strQuery UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            while(sqlite3_step(statment)==SQLITE_ROW)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 0)] forKey:@"categoryname"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 1)]  forKey:@"image"];
                [arrData addObject:dict];
                int i = sqlite3_column_count(statment);
                NSLog(@"%d",i);
                NSLog(@"%@",dict);
            }
            
            
            sqlite3_finalize(statment);
        }
        sqlite3_close(dbObj);
    }
    
    
    
    
    
    
    
    return arrData;
}


-(NSMutableArray *)SelectDatarem:(NSString *)strQuery{
    
    arrData = [[NSMutableArray alloc]init];
    if( sqlite3_open([strDbPath UTF8String], &dbObj) ==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(dbObj, [strQuery UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            while(sqlite3_step(statment)==SQLITE_ROW)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                //add total reminder what we have done
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 0)] forKey:@"title"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 1)]  forKey:@"date"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 2)]  forKey:@"repeat"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 3)]  forKey:@"loc"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 4)]  forKey:@"cat"];
                [arrData addObject:dict];
                int i = sqlite3_column_count(statment);
                NSLog(@"%d",i);
                NSLog(@"%@",dict);
            }
            
            
            sqlite3_finalize(statment);
        }
        sqlite3_close(dbObj);
    }
    
    
    
    
    
    
    
    return arrData;
}

-(NSMutableArray *)SelectUser:(NSString *)strQuery{
    
    arrData = [[NSMutableArray alloc]init];
    if( sqlite3_open([strDbPath UTF8String], &dbObj) ==SQLITE_OK)
    {
        sqlite3_stmt *statment;
        
        if(sqlite3_prepare_v2(dbObj, [strQuery UTF8String], -1, &statment, nil)==SQLITE_OK)
        {
            while(sqlite3_step(statment)==SQLITE_ROW)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                //add total reminder what we have done
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 0)] forKey:@"id"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 1)]  forKey:@"emailid"];
                [dict setObject:[NSString stringWithFormat:@"%s",(char *) sqlite3_column_text(statment, 2)]  forKey:@"status"];
                [arrData addObject:dict];
                int i = sqlite3_column_count(statment);
                NSLog(@"%d",i);
                NSLog(@"%@",dict);
            }
            
            
            sqlite3_finalize(statment);
        }
        sqlite3_close(dbObj);
    }
    
    
    
    
    
    
    
    return arrData;
}
@end
