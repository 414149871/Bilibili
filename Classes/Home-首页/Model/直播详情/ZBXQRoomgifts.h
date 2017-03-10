//
//  ZBXQRoomgifts.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBXQCoinType;

@interface ZBXQRoomgifts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *countSet;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double roomgiftsIdentifier;
@property (nonatomic, strong) NSString *gifUrl;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) ZBXQCoinType *coinType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
