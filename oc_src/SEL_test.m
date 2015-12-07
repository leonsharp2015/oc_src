//
//  SEL_test.m
//  oc_src
//
//  Created by lanou3g on 15/12/7.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "SEL_test.h"

@implementation SEL_test
-(NSInteger) sum:(NSNumber *) a1
         another:(NSNumber *) a2
{
    NSInteger result=[a1 integerValue]+[a2 integerValue];
    return result;
}

-(NSString *) appendString:(NSString *) s1
                     other:(NSString *) s2
{
    NSString *p=[s1 stringByAppendingString:s2];
    return p;
}


@end
