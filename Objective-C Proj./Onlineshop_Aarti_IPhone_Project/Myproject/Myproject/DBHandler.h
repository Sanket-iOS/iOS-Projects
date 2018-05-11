//
//  DBHandler.h
//  Myproject
//
//  Created by mac on 2/19/15.
//  Copyright (c) 2015 disha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHandler : NSObject
-(BOOL)DMLOperations:(NSString*)query;
-(NSArray*)SelectStudents:(NSString *)query;
@end
