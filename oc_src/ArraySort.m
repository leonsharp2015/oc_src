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


-(void) foo_1
{
    NSMutableArray *array=[NSMutableArray array];
    Person *p1=[[Person alloc] initWithName:@"zhangsan" age:12];
    Person *p2=[[Person alloc] initWithName:@"lisi" age:98];
    Person *p3=[[Person alloc] initWithName:@"bob" age:10];
    [array addObject:p1];
    [array addObject:p2];
    [array addObject:p3];
    NSArray *result=nil;
    
    //创建谓词 http://blog.sina.com.cn/s/blog_859ab336010158dz.html
    //1.
    NSPredicate *pre_name = [NSPredicate predicateWithFormat:
                              @" name == %@", @"zhangsan"];
    result = [array filteredArrayUsingPredicate:pre_name];
    NSLog(@"%@",[array filteredArrayUsingPredicate:pre_name]);
    //2.
    NSPredicate *pre_age= [NSPredicate predicateWithFormat:
                      @" age>1 and age<50"];
    result = [array filteredArrayUsingPredicate:pre_age];
    
    //字符串谓词.如果数组放的都是字符串（或者是其他没有属性的类型）,用self
    NSArray *str_array=[NSArray arrayWithObjects:
                     @"Apple", @"Google", @"MircoSoft", nil];
    NSPredicate *pre2 = [NSPredicate
                         predicateWithFormat:@"SELF=='Apple'"];
    
    pre2 = [NSPredicate predicateWithFormat:
                @"SELF CONTAINS %@",@"o"];

    result = [str_array filteredArrayUsingPredicate:pre2];
    
    //正则表达式
    NSString *regex = @"^A.+e$";//以A 开头，以e 结尾的字符。
    NSPredicate *pre3= [NSPredicate
                       predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL chk= [pre3 evaluateWithObject:@"Aaaple"];

    
}

-(void) test
{
    /*
    //@"冬瓜,西瓜,火龙果,大头,小狗"
    
    NSArray *array = [[NSArray alloc] initWithObjects:
                      @"beijing",@"shanghai",
                      @"guangzou",@"wuhan",
                      nil];
    NSString *string = @"ang";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:
                         @"SELF CONTAINS %@",string];
    
    NSLog(@"%@",[array filteredArrayUsingPredicate:pred]);
    */
    [self foo_1];
    
}
@end
