//
//  Regex_Test.m
//  oc_src
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 lanou3g. All rights reserved.
// 

#import "Regex_Test.h"

@implementation Regex_Test
-(void) test
{
    //1.正则表达式与NSPredicate连用
    BOOL chk=NO;
    NSString *temp=@"12j456";
    NSString *strReg=@"^[0-9]+$";
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",strReg];
    chk=[pre evaluateWithObject:temp];
    //2.string rangeOfString
    NSString *str1 = @"can you A speak English";
    NSString *str = @"A";
    //在str1这个字符串中搜索\n，判断有没有,range.location==NSNotFound的判断
    if ([str1 rangeOfString:str].location != NSNotFound) {
        NSLog(@"这个字符串中有%@",str);
    }
    //3.string的子字符串匹配
    temp = @"ff10289fffr991";//10289fff返回NSNotFound
    NSRange range = [temp rangeOfString:@"^[0-9]+$" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound)
    {
        NSLog(@"range ：%@", [temp substringWithRange:range]);
    }
    
    //4.正则表达式
    NSString *searchText = @"ad12366ff";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^*[0-9]*$" options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    if (result) {
        NSLog(@"===%@", [searchText substringWithRange:result.range]);
    }
    
    
}

-(void) test_regex //NSRegularExpression类
{
    //numberOfMatchesInString
    
    //1.
    NSString *temp=@"http://www.baidu.com&http://www.sina.com&http://www.sohu.com";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = nil;
    NSString *subStr = nil;
    
    array = [regex matchesInString:temp options:0 range:NSMakeRange(0, [temp length])];
    for (NSTextCheckingResult* b in array)
    {
        //subStr 是每个和表达式匹配好的字符串。
        subStr = [temp substringWithRange:b.range];
        NSLog(@" str 1 is %@",subStr);
    }
    
    //2.拆分字符串中的数字
    temp=@"123ef78682ji90";
    regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"[0-9]+"
                                  options:NSRegularExpressionCaseInsensitive error:nil];
    array = nil;
    array = [regex matchesInString:temp options:0 range:NSMakeRange(0, [temp length])];
//    NSInteger count=[regex numberOfMatchesInString:temp options:0
//                                             range:NSMakeRange(0, [temp ength])];
    subStr = nil;
    for (NSTextCheckingResult* b in array)
    {
        //subStr 是每个和表达式匹配好的数字字符串。
        subStr = [temp substringWithRange:b.range];
        NSLog(@" str 1 is %@",subStr);
    }

    //3.firstMaches
    
    //组装一个字符串，需要把里面的网址解析出来
    NSString *urlString=@"<meta/><link/><title>1Q84 BOOK1</title></head>                            ";
    NSError *error;
    
    
    regex = [NSRegularExpression regularExpressionWithPattern:
                        @"(?<=title\\>).*(?=</title)"
                       options:0 error:&error];
    
    NSInteger count=[regex numberOfMatchesInString:urlString options:0
                                             range:NSMakeRange(0, [urlString length])];
    
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:urlString options:0 range:NSMakeRange(0, [urlString length])];
        
        if (firstMatch)
        {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[urlString substringWithRange:resultRange];//从urlString当中截取数据
            NSLog(@"->%@<-",result);
        } 
        
    }
    
    
    
    
    

}



@end
