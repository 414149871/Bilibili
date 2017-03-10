//
//  ZBHRecommendData.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBHPartition;

@interface ZBHRecommendData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lives;
@property (nonatomic, strong) NSArray *bannerData;
@property (nonatomic, strong) ZBHPartition *partition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
