//
//  DBoperation.h
//  IncomeTax
//
//  Created by tops on 3/25/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>

@interface DBoperation : NSObject
{
    AppDelegate *appdel;
    sqlite3 *Database;
}
@property(retain,nonatomic)NSString *strDBMnem;
-(BOOL)DMLOpearion:(NSString *)query;
-(NSString *)userlogin:(NSString *)str;
-(NSMutableArray *)SelectId:(NSString *)Query;
@end
