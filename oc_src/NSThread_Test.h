//
//  NSThread_Test.h
//  oc_src
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread_Test : NSObject //???
{
    int tickets;
    int count;
    NSThread* ticketsThreadone;
    NSThread* ticketsThreadtwo;
    NSCondition* ticketsCondition;
    NSLock *theLock;
}
-(void) main3;
@end
