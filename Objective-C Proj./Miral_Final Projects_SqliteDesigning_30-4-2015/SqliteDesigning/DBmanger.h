//
//  DBmanger.h
//  SqliteDesigning
//
//  Created by tops on 3/3/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"


@interface DBmanger : NSObject
{
    sqlite3 *database;
    AppDelegate *appDel;
}

@property (retain,nonatomic)NSString *strDB;

-(void)DMLOperation:(NSString *)query;

-(NSString *)DMLOpertion_other:(NSString *)query;

-(NSMutableArray *)DMLOpertion_detailArr:(NSString *)query;

-(void)DMLOpertion_update:(NSString *)query;

@property (retain,nonatomic)NSMutableArray *en_arr,*pwd_arr,*name_arr,*sem_arr,*mobile_arr,*email_arr,*branch_arr,*detail_arr;


@end
