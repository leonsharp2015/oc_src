//
//  Regex_Test.m
//  oc_src
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
// 

#import "Regex_Test.h"

@implementation Regex_Test
-(void) test_stringRange
{
    //1.string rangeOfString
    NSString *str1 = @"can you A speak English";
    NSString *str = @"A";
    
    if ([str1 rangeOfString:str].location != NSNotFound) {
        NSLog(@"这个字符串中有%@",str);
    }
    //2.NSRegularExpressionSearch
    NSString *temp = @"10289";//10289fff返回NSNotFound
    NSRange range = [temp rangeOfString:@"^[0-9]+$" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound)
    {
        NSLog(@"range ：%@", [temp substringWithRange:range]);
    }
    

    
    
}

-(void) test_regex //NSRegularExpression类
{
    //1.matchesInString拆分字符串为数组
    NSString *temp=@"http://www.baidu.com&http://www.sina.com&http://www.sohu.com";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = nil;
    NSString *subStr = nil;
    
    array = [regex matchesInString:temp options:0 range:NSMakeRange(0, [temp length])];
    for (NSTextCheckingResult* b in array)
    {
        subStr = [temp substringWithRange:b.range];//subStr 是每个和表达式匹配好的字符串。
        NSLog(@" str 1 is %@",subStr);
    }
    
    //拆分字符串中的数字,共3组
    temp=@"123ef78682ji90";
    regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"[0-9]+"
                                  options:NSRegularExpressionCaseInsensitive error:nil];
    array = nil;
    array = [regex matchesInString:temp options:0 range:NSMakeRange(0, [temp length])];
//    NSInteger count=[regex numberOfMatchesInString:temp options:0                                  range:NSMakeRange(0, [temp ength])];
    subStr = nil;
    for (NSTextCheckingResult* b in array)
    {
        //subStr 是每个和表达式匹配好的数字字符串。
        subStr = [temp substringWithRange:b.range];
        NSLog(@" str 1 is %@",subStr);
    }

    //2.firstMaches
    //将字符串里面的字符串解析出来
    NSString *urlString=@"<meta/><link/><title>1Q84 BOOK1</title></head>";
    NSError *error;
    regex = [NSRegularExpression regularExpressionWithPattern:
                        @"(?<=title\\>).*(?=</title)"
                       options:0 error:&error];
    
    if (regex != nil)
    {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:urlString options:0 range:NSMakeRange(0, [urlString length])];
        
        if (firstMatch)//如果匹配到
        {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[urlString substringWithRange:resultRange];//从urlString当中截取数据
            NSLog(@"->%@<-",result);
        }
        //替换
        NSString *result=[regex stringByReplacingMatchesInString:urlString options:0 range:NSMakeRange(0, [urlString length]) withTemplate:@"aaa"];
        
    }
    
    //将字符串里面的第一组数字字符串解析出来
    temp = @"jj12366kkk9854";
    regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *firstMatch = [regex firstMatchInString:temp options:0 range:NSMakeRange(0, [temp length])];
    if (firstMatch)
    {
        NSLog(@"===%@", [temp substringWithRange:firstMatch.range]);
    }
    
    //3.验证.与谓词一起用
    BOOL chk=NO;
    temp=@"12456";
    NSString *strReg=@"^[0-9]+$";
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",strReg];
    chk=[pre evaluateWithObject:temp];
    

    
    
    
    

}



@end
