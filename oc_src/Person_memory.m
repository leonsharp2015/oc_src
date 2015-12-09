//
//  Person.m
//  OCLession8_5
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Person_memory.h"

@implementation Person_memory
-(id) copyWithZone:(NSZone *)zone
{
    //深复制
    Person_memory *p=[[Person_memory alloc] init];
    p.name=self.name;
    p.age=self.age;
    return p;
     
    /*//浅复制
    Person *s=[self retain];//把指针付给
    return s;
     */
}
-(void) dealloc
{
    NSString *t1=self.name;//self.name=nil
    NSInteger t2=self.age;//0
    NSLog(@"person销毁");
    [super dealloc];
}
@end
