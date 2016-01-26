//
//  DataManager.h
//  搜图必备
//
//  Created by tareba on 16/1/25.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"
@interface DataManager : NSObject
- (NSArray *) ParseJsonWith:(NSDictionary *)Dic ;
@end
