//
//  SEL_test.h
//  oc_src
//
//  Created by lanou3g on 15/12/7.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEL_test : NSObject
-(NSInteger) sum2:(NSNumber *) a1 //未实现的接口
         another2:(NSNumber *) a2;

-(NSInteger) sum:(NSNumber *) a1
         another:(NSNumber *) a2;
-(NSString *) appendString:(NSString *) s1
                     other:(NSString *) s2;

@end
