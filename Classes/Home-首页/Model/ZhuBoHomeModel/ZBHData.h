//
//  ZBHData.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBHRecommendData;

@interface ZBHData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZBHRecommendData *recommendData;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
