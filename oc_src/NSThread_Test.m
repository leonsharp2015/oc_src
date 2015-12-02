//
//  NSThread_Test.m
//  oc_src
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "NSThread_Test.h"

@implementation NSThread_Test

-(void) main3
{
    tickets = 100;
    count = 0;
    // 锁对象
    ticketsCondition = [[NSCondition alloc] init];
    ticketsThreadone = [[NSThread alloc] initWithTarget:self selector:@selector(run3) object:nil];
    [ticketsThreadone setName:@"Thread-1"];
    [ticketsThreadone start];
    
    
    ticketsThreadtwo = [[NSThread alloc] initWithTarget:self selector:@selector(run3) object:nil];
    [ticketsThreadtwo setName:@"Thread-2"];
    [ticketsThreadtwo start];
}
- (void)run3
{
    NSLog(@"-----------");
    while (TRUE)
    {
        // 上锁
        [ticketsCondition lock];
        if(tickets > 0)
        {
            [NSThread sleepForTimeInterval:0.5];
            count = 100 - tickets;
            NSLog(@"当前票数是:%d,售出:%d,线程名:%@",tickets,count,
                  [[NSThread currentThread] name]);
            tickets--;
        }
        else
        {
            break;
        }
        [ticketsCondition unlock];
    }
}

- (void)dealloc
{
    /*
    [ticketsThreadone release];
    [ticketsThreadtwo release];
    [ticketsCondition release];
    [super dealloc];
     */
}



@end
