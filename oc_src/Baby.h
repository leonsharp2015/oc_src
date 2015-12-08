//
//  Baby.h
//  oc_src
//
//  Created by lanou3g on 15/12/8.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaoMuProtocol.h"
@interface Baby : NSObject<BaoMuProtocol>
{
    id<BaoMuProtocol> _delegate;
}
-(void) setDelegate:(id<BaoMuProtocol>) delegate;

-(void) hungry;//需求
-(void) crying;//需求

@end
