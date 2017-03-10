//
//  ZBHLives.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBHOwner, ZBHCover;

@interface ZBHLives : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *acceptQuality;
@property (nonatomic, strong) ZBHOwner *owner;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) double checkVersion;
@property (nonatomic, assign) double areaId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isTv;
@property (nonatomic, strong) ZBHCover *cover;
@property (nonatomic, strong) NSString *playurl;
@property (nonatomic, assign) double online;
@property (nonatomic, assign) double broadcastType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
