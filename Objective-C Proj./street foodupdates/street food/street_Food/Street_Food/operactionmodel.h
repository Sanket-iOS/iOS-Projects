//
//  operactionmodel.h
//  project
//
//  Created by kajal on 27/09/16.
//  Copyright © 2016 Priyal Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>
#import "AppDelegate.h"

@interface operactionmodel : NSObject
{
    sqlite3 *dbObj;
    NSString *strDbPath;
    NSMutableArray *arrData;
    AppDelegate *appDel;
}

//insert upadte delete
-(BOOL) CommandMethod:(NSString *) strQuery;

//select
-(NSMutableArray *) SelectData:(NSString *) strQuery;
//SelectDatarem
-(NSMutableArray *) SelectDatarem:(NSString *) strQuery;
-(NSMutableArray *) SelectUser:(NSString *) strQuery;
-(NSMutableArray *) SelectSub:(NSString *) strQuery;


@end
