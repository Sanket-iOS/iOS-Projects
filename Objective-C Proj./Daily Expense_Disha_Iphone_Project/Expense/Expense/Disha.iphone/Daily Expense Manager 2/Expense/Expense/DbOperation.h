//
//  DbOperation.h
//  Expense
//
//  Created by mac on 3/13/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DbOperation : NSObject
-(BOOL)DMLOperation:(NSString*)query;

-(NSMutableArray *)selectTrans;
-(NSMutableArray *)selectRemin;
-(NSMutableArray *)selectRegister;
-(NSMutableArray *)selectAdminUser;
-(NSMutableArray*)selectDateAndTime:(NSString*)Query;
@end
