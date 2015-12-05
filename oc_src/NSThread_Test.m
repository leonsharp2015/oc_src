//
//  NSThread_Test.m
//  oc_src
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
// 

#import "NSThread_Test.h"

@implementation NSThread_Test //???

-(void) main3
{
    
    tickets = 100;
    count = 0;
    theLock = [[NSLock alloc] init];
    // 锁对象
    ticketsCondition = [[NSCondition alloc] init];
    ticketsThreadone = [[NSThread alloc] initWithTarget:self selector:@selector(run1) object:nil];
    [ticketsThreadone setName:@"Thread-1"];
    [ticketsThreadone start];
    
    ticketsThreadtwo = [[NSThread alloc] initWithTarget:self selector:@selector(run1) object:nil];
    [ticketsThreadtwo setName:@"Thread-2"];
    [ticketsThreadtwo start];
    
    NSThread *ticketsThreadthree = [[NSThread alloc] initWithTarget:self selector:@selector(run3) object:nil];
    [ticketsThreadthree setName:@"Thread-3"];
    [ticketsThreadthree start];
}

- (void)run1
{
    NSLog(@"=======");
    sleep(1000);
    while (TRUE)
    {
        // 上锁
        [ticketsCondition lock];
        [ticketsCondition wait];
        [theLock lock];
        if(tickets >= 0){
            [NSThread sleepForTimeInterval:0.09];
            count = 100 - tickets;
            NSLog(@"当前票数是:%d,售出:%d,线程名:%@",tickets,count,[[NSThread currentThread] name]);
            tickets--;
        }else
        {
            break;
        }
        [theLock unlock];
        [ticketsCondition unlock];
    }
}

-(void)run3
{
    while (YES)
    {
        [ticketsCondition lock];
        [NSThread sleepForTimeInterval:3];
        [ticketsCondition signal];
        [ticketsCondition unlock];
    }
}



- (void)dealloc
{
    
    [ticketsThreadone release];
    [ticketsThreadtwo release];
    [ticketsCondition release];
    [super dealloc];
     
}



@end
