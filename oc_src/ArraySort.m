//
//  ArraySort.m
//  oc_src
//
//  Created by lanou3g on 15/12/3.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ArraySort.h"
#import "Person.h"
@implementation ArraySort


-(void) foo_search
{
    // http://blog.sina.com.cn/s/blog_859ab336010158dz.html
    NSMutableArray *array=[NSMutableArray array];
    Person *p1=[[Person alloc] initWithName:@"zhangsan" age:12];
    Person *p2=[[Person alloc] initWithName:@"lisi" age:98];
    Person *p3=[[Person alloc] initWithName:@"bob" age:10];
    [array addObject:p1];
    [array addObject:p2];
    [array addObject:p3];
    NSArray *result=nil;
    
    //创建谓词
    //1.按对象的属性查询
    NSPredicate *pre_name = [NSPredicate predicateWithFormat:
                              @" name == %@", @"zhangsan"];
    result = [array filteredArrayUsingPredicate:pre_name];
    NSLog(@"%@",[array filteredArrayUsingPredicate:pre_name]);
    
    NSPredicate *pre_age= [NSPredicate predicateWithFormat:
                      @" age>1 and age<50"];
    result = [array filteredArrayUsingPredicate:pre_age];
    
    //2.如果数组放的都是字符串（或者是其他没有属性的类型）,用self
    NSArray *str_array=[NSArray arrayWithObjects:
                            @"Apple", @"Google", @"MircoSoft", nil];
    NSPredicate *pre2 = [NSPredicate predicateWithFormat:
                         @"SELF=='Apple'"];
    
    pre2 = [NSPredicate predicateWithFormat:
                @"SELF CONTAINS %@",@"o"];

    result = [str_array filteredArrayUsingPredicate:pre2];
    
    
}

-(void) sort_array_1 //block实现数组内对象排序
{
    NSMutableArray *array=[NSMutableArray array];
    Person *p1=[[Person alloc] initWithName:@"zhangsan" age:12];
    Person *p2=[[Person alloc] initWithName:@"lisi" age:98];
    Person *p3=[[Person alloc] initWithName:@"bob" age:10];
    [array addObject:p1];
    [array addObject:p2];
    [array addObject:p3];
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        Person *s1=(Person *)obj1;
        Person *s2=(Person *)obj2;
        
        if([s1 age]>[s2 age])
        {
            return NSOrderedDescending;
        }
        else if([s1 age]>[s2 age])
        {
            return NSOrderedAscending;
        }
        else
        {
            return NSOrderedSame;
        }
 
    }];
    for (Person *p in array)
    {
        NSLog(@"%@,%ld",[p name],[p age]);
    }
    
}



-(void) sort_array_2 //利用Person内的排序方法.在array中@select中调用
{
    NSMutableArray *array=[NSMutableArray array];
    Person *p1=[[Person alloc] initWithName:@"zhangsan" age:12];
    Person *p2=[[Person alloc] initWithName:@"lisi" age:98];
    Person *p3=[[Person alloc] initWithName:@"bob" age:10];
    [array addObject:p1];
    [array addObject:p2];
    [array addObject:p3];
    //comaprePersonAge必须放在Person类中
    //[array sortedArrayUsingSelector:@selector(comaprePersonAge:)];
    [array sortUsingSelector:@selector(comaprePersonAge:)];
    
    for (Person *p in array)
    {
        NSLog(@"%@,%ld",[p name],[p age]);
    }
    
}


-(void) test
{
    //[self sort_array_1];
    [self sort_array_2];
    
    NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:@"mn",@"hj",@"a5",@"z1" ,nil];
    
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 ];
    }];
    for (NSString *k in array) {
        NSLog(@"%@",k);
    }

    
    
}
@end
