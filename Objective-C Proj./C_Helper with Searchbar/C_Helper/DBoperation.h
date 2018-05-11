//
//  DBoperation.h
//  C_Helper
//
//  Created by mac on 4/1/15.
//  Copyright (c) 2015 ratan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

@interface DBoperation : NSObject
{
    NSString *strCFList;
    sqlite3 *database;
    
    
}


//-(BOOL)DMLOperation:(NSString *)query;
-(NSMutableArray *)Selectuser;

@end
