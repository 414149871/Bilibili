//
//  ZBXQRecommend.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBXQOwner, ZBXQCover;

@interface ZBXQRecommend : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZBXQOwner *owner;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) ZBXQCover *cover;
@property (nonatomic, assign) double roomId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
