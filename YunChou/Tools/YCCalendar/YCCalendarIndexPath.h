//
//  YCCalendarIndexPath.h
//  caltextsssss
//
//  Created by yy on 2018/10/15.
//  Copyright © 2018年 yy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCCalendarIndexPath : NSObject

@property (nonatomic, assign, readonly) NSInteger line;

@property (nonatomic, assign, readonly) NSInteger row;

+ (YCCalendarIndexPath *)indextPathWithLine:(NSInteger)line andRow:(NSInteger)row;


@end

NS_ASSUME_NONNULL_END
