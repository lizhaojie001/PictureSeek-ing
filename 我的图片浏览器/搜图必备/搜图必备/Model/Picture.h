//
//  Picture.h
//  搜图必备
//
//  Created by tareba on 16/1/25.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Picture : NSObject
/**
 *  图片链接
 */
@property (nonatomic,strong) NSString *ObjUrl;
/**
 *  图片类型
 */
@property (nonatomic,strong) NSString *Pictype;
/**
 *  图片位置
 */
@property (nonatomic,strong) NSNumber* Pagenum;


@end
