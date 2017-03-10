//
//  NRDLives.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NRDOwner, NRDCover;

@interface NRDLives : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *acceptQuality;
@property (nonatomic, strong) NRDOwner *owner;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) double checkVersion;
@property (nonatomic, assign) double areaId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double isTv;
@property (nonatomic, strong) NRDCover *cover;
@property (nonatomic, strong) NSString *playurl;
@property (nonatomic, assign) double online;
@property (nonatomic, assign) double broadcastType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
