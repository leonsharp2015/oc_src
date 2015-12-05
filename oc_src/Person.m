//
//  Person.m
//  OCLession4
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Person.h" 

@implementation Person

//为array集合中的排序sortedArrayUsingSelector，做方法。以便@select调用。必须在Person中实现
-(NSComparisonResult) comaprePersonAge:(Person *) p1
{
    if([p1 age] >[self age])
    {
        return NSOrderedDescending;
    }
    else if([p1 age] <[self age])
    {
        return NSOrderedAscending;
    }
    else
    {
        return NSOrderedSame;
    }
    
}


-(instancetype) initWithName:(NSString *) name
                         age:(NSInteger) age
{
    self=[super init];
    if(self)
    {
        _name=name;
        _age =age;
    }
    return self;
    
}
-(void) sayHi
{
    NSLog(@"person SAY %@,%ld",_name,_age);
}
-(void) setName:(NSString *)name;
{
    _name=name;
}
-(NSString *) name
{
    return _name;
}

-(void) setAge:(NSInteger) age
{
    _age=age;
}
-(NSInteger) age
{
    return _age;
}
@end
