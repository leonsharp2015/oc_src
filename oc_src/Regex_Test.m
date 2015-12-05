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
    //2.string 
}
@end
