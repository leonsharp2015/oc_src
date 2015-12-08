//
//  main.m
//  oc_src
//
//  Created by lanou3g on 15/12/2.
//  Copyright © 2015年 lanou3g. All rights reserved.
// 

#import <Foundation/Foundation.h>
#import "ArraySort.h"
#import "Regex_Test.h"
#import "SEL_test.h"
#import "Woman.h"
#import "Baby.h"

void foo_test_SEL()//测试SEL
{
    /*
     Objective-C在编译的时候，会根据方法的名字（包括参数序列），生成一个用 来区分这个方法的唯一的一个ID，这个ID就是SEL类型的。我们需要注意的是，只要方法的名字（包括参数序列）相同，那么它们的ID都是相同的
     
     注意1. @selector是查找当前类的方法，而[object @selector(方法名:方法参数..) ] ;是取object对应类的相关方法.
     注意2.查找类方法时，除了方法名,方法参数也查询条件之一.
     注意3. 可以用字符串来找方法 SEL　变量名　=　NSSelectorFromString(方法名字的字符串);
     
     */
    
    //SEL
    SEL_test *tt=[[SEL_test alloc] init];
    
    SEL class_func =@selector(sum2:another2:);//未实现的接口
    if([tt respondsToSelector:class_func]) //判断该对象是否有相应的方法实现
    {
        NSNumber *v1=[NSNumber numberWithInt:12];
        NSNumber *v2=[NSNumber numberWithInt:15];
        
        NSInteger a= [tt performSelector:class_func
                              withObject:v1
                              withObject:v2];
        NSLog(@"%ld",a);
    }
    
    //按字符串得到sel
    SEL class_fun2=NSSelectorFromString(@"appendString:other:");
    if([tt respondsToSelector:class_fun2])
    {
        NSString *r=[tt performSelector:class_fun2 withObject:@"abc" withObject:@"xyz"];
        NSLog(@"%@",r);
    }

}
void foo_testDelegate()//代理
{
    /*
    1.创建保姆协议，方法：做饭，哄孩子
    2.创建Baby类，实例变量:_delegate,遵守协议。方法:饿hungry,哭crying
    3.创建Woman类，遵守协议，实现方法
    4.在main.m中创建Baby对象和Woman对象，实现代理
    */
    Baby *b=[[Baby alloc] init];
    Woman *w=[[Woman alloc] init];
    [b setDelegate:w];
    [b crying];
}
int main(int argc, const char * argv[])
{

    //Regex_Test *reg=[[Regex_Test alloc]init];
    //[reg test_regex];
    //ArraySort *sort=[[ArraySort alloc] init ];
    //[sort test];
    //foo_test_SEL();

    foo_testDelegate();


    
}
