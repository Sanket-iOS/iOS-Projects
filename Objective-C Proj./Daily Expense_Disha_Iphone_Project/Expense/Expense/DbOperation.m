//
//  DbOperation.m
//  Expense
//
//  Created by mac on 3/13/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "DbOperation.h"
#import <sqlite3.h>
@implementation DbOperation
-(id)init
{
    [self CopyPasteDocumentFile];
    return self;
}
-(NSString *)DocumentDirectoryPath

{
    NSString *strHome=NSHomeDirectory();
    NSString *strDocum=[strHome stringByAppendingPathComponent:@"Documents"];
    return strDocum;
}
-(void)CopyPasteDocumentFile
{
    NSString *strFromPath=[[NSBundle mainBundle]pathForResource:@"DailyMang" ofType:@"sqlite"];
    NSString *strToPath=[[self DocumentDirectoryPath]stringByAppendingPathComponent:@"DailyMang.sqlite"];
    NSFileManager *filem=[NSFileManager defaultManager];
    
    NSLog(@"%@",strToPath);
    if(![filem fileExistsAtPath:strToPath])
    {
        [filem copyItemAtPath:strFromPath toPath:strToPath error:nil];
    }
    //    else
    //    {
    //        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"message" message:@"File Alredy Exits!!"delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    //        [alt show];
    //    }
}
-(BOOL)DMLOperation:(NSString*)query
{
    BOOL status=NO;
    NSString *strDbFile=[[self DocumentDirectoryPath]stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    if(sqlite3_open([strDbFile UTF8String], &database)==SQLITE_OK)
    {
        NSLog(@"%@",query);
        sqlite3_stmt *statment;
        if(sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, NULL)==SQLITE_OK)
        {
            sqlite3_step(statment);
            status=YES;
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return status;
}
-(NSMutableArray *)selectTrans
{
    NSString *strQuery=@"select * from Trans";
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [strQuery UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                int utid=sqlite3_column_int(statments, 0);
                NSString *uitem=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                int uprice=sqlite3_column_int(statments, 2);
                NSString *ucate=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 3)];
                
                
                NSString *datestring=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statments, 4)];
                NSDateFormatter *df=[[NSDateFormatter alloc]init];
                [df setDateFormat:@"dd/MM/yyyy"];
                NSDate *date=[df dateFromString:datestring];
                NSString *uDesc=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 5)];
                NSString *umode=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 6)];
                NSDictionary *mdic=@{@"TID":[NSNumber numberWithInt:utid],@"ITEM":uitem,@"CATE":ucate,@"DATE":date,@"PRICE":[NSNumber numberWithInt:uprice],@"DESC":uDesc,@"MODE":umode};
                [arrItems addObject:mdic];
                
                
                NSLog(@"%@",arrItems);
                
                
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
    
}
-(NSMutableArray *)selectRemin

{
    NSLog(@"%@",NSHomeDirectory());
    NSString *strQuery=@"select * from Reminder";
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [strQuery UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                int rid=sqlite3_column_int(statments, 0);
                //                NSString *datestring=[NSString stringWithUTF8String:(char *)sqlite3_column_text(statments,1)];
                //                NSDateFormatter *df=[[NSDateFormatter alloc]init];
                //                [df setDateFormat:@"dd/MM/YYY"];
                //                NSDate *date=[df dateFromString:datestring];
                NSString *date=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                NSString *rtime=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 2)];
                
                
                NSString *raddt=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 6)];
                NSString *recur=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 7)];
                
                NSString * noti=[NSString stringWithFormat:@"%s",sqlite3_column_text(statments, 8)];
                
                NSDictionary *dic=@{@"RID":[NSNumber numberWithInt:rid],@"DATE":date,@"TIME":rtime,@"ADD":raddt,@"RECUR":recur,@"NOTI":noti};
                [arrItems addObject:dic];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
    
}
-(NSMutableArray*)selectCategory
{
    
    NSString *strQuery=@"select * from Category";
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [strQuery UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                 int cid=sqlite3_column_int(statments, 0);
                
                NSString *cnm=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                
                
                NSDictionary *dic=@{@"CID":[NSNumber numberWithInt:cid],@"CNAME":cnm};
                [arrItems addObject:dic];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;

}
-(NSMutableArray*)selectDateAndTime:(NSString*)Query
{
    NSLog(@"%@",NSHomeDirectory());
    
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [Query UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            NSLog(@"%@",Query);
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                //   int rid=sqlite3_column_int(statments, 0);
                NSString *sdate=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 0)];
                
                NSString *rtime=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                int price=sqlite3_column_int(statments, 4);
                
                NSString *addto=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 2)];
                
                NSString *recure=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 3)];
                NSLog(@"haiiii");
                
                NSDictionary *dic=@{@"DATE":sdate,@"TIME":rtime,@"PRICE":[NSNumber numberWithInt:price],@"ADD":addto,@"RECURE":recure};
                [arrItems addObject:dic];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
    
    
}
-(NSMutableArray *)selectRegister:(NSString*)Query
{
  
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [Query UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                NSString *unm=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 0)];
                
                NSString *ups=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                NSString *uEmail=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 2)];
                NSLog(@"dkjghdjsgh");

                int uCon=sqlite3_column_int(statments, 3);
                int uInc=sqlite3_column_int(statments, 4);
                
                

                NSDictionary *dic=@{@"NAME":unm,@"PASS":ups,@"EMAIL":uEmail,@"CONTACT":[NSNumber numberWithInt:uCon],@"INC":[NSNumber numberWithInt:uInc]};
                [arrItems addObject:dic];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;
    
}
-(NSMutableArray *)selectAdminUser
{
    NSString *strQuery=@"select * from Admin";
    NSString *strDatabaseFile=[[self DocumentDirectoryPath] stringByAppendingPathComponent:@"DailyMang.sqlite"];
    sqlite3 *database;
    NSMutableArray *arrItems=[[NSMutableArray alloc]init];
    if( sqlite3_open([strDatabaseFile UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *statments;
        if(sqlite3_prepare_v2(database, [strQuery UTF8String], -1, &statments, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(statments)==SQLITE_ROW)
            {
                
                NSString *unm=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 0)];
                
                NSString *ups=[NSString stringWithUTF8String:(char*)sqlite3_column_text(statments, 1)];
                
                
                NSDictionary *dic=@{@"NAME":unm,@"PASS":ups};
                [arrItems addObject:dic];
            }
            
            
        }
        sqlite3_finalize(statments);
    }
    sqlite3_close(database);
    return  arrItems;

}


@end
