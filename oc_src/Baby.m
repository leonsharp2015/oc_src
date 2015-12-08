//
//  Baby.m
//  oc_src
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "Baby.h"

@implementation Baby
-(void) setDelegate:(id<BaoMuProtocol>) delegate
{
    _delegate=delegate;
}

-(void) hungry
{
    if([_delegate respondsToSelector:@selector(cook)])
    {
        [_delegate cook];
    }
}
-(void) crying
{
    if([_delegate respondsToSelector:@selector(playWithBoy)])
    {
        [_delegate playWithBoy];
    }
        
}
@end
