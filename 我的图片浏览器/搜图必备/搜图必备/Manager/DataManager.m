//
//  DataManager.m
//  搜图必备
//
//  Created by tareba on 16/1/25.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
- (NSArray *) ParseJsonWith:(NSDictionary *)Dic {
    NSDictionary *data = Dic[@"data"];
    NSArray * ResultArray = data[@"ResultArray"];
    NSMutableArray *array = [NSMutableArray array];
    for(NSDictionary *Dics in ResultArray){
        Picture *pic = [[Picture alloc]init];
        [pic setValuesForKeysWithDictionary:Dics];
        [array addObject:pic];
    }
        
    return [array copy];
    
}
@end
