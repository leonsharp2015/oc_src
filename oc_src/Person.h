//
//  Person.h
//  OCLession4
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
// 

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}
//为array集合中的排序sortedArrayUsingSelector，做方法。以便@select调用。必须在Person中实现
-(NSComparisonResult) comaprePersonAge:(Person *) person;

-(instancetype) initWithName:(NSString *) name
                         age:(NSInteger) age;
-(void) sayHi;
-(void) setName:(NSString *)name;
-(NSString *) name;

-(void) setAge:(NSInteger) age;
-(NSInteger) age;
@end
