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
#import "Person_memory.h"

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
void foo_autorelease()
{
    NSInteger k=0;
    Person_memory *p=[[Person_memory alloc] init];
    p.name=@"zhangsan";
    p.age=15;
    k=p.retainCount;//1
    Person_memory *p_copy=[p copy];// Person必须实现copyWithZone
    k=p.retainCount;//1 深拷贝后，p.retainCount不变化
    
    Person_memory *p_retain=[p retain];//retain是创建一个指针，引用对象计数加1
    k=p.retainCount;//2
    k=p_retain.retainCount;//2
    BOOL isequal=[p isEqual:p_copy];//no
    isequal=[p_copy isEqual:p_retain];//no
    isequal=[p isEqual:p_retain];//yes
    
    //1.操作p_copy，p,p_retain不受影响
    k=p_copy.retainCount;//1
    [p_copy release];//执行完毕后，p.retainCount＝0，调用dealloc
    //release才是真正用于内存释放的，release后系统会将该块内存标记为可用（可重新分配）
    p_copy=nil;//nil就是把一个对象的指针置为空，只是切断了指针与内存中对象的联系
    NSLog(@"------------");
    //2.操作p_retain
    k=p_retain.retainCount;//2,p.retainCount=2
    [p_retain release];//1,p.retainCount=1
    [p_retain release];//执行完毕后，
    //p.retainCount＝p_retain.retainCount=0，
    //调用dealloc
    p_retain=nil;

}
int main(int argc, const char * argv[])
{

    //Regex_Test *reg=[[Regex_Test alloc]init];
    //[reg test_regex];
    //ArraySort *sort=[[ArraySort alloc] init ];
    //[sort test];
    //foo_test_SEL();

    //foo_testDelegate();
    foo_autorelease();

    
}
