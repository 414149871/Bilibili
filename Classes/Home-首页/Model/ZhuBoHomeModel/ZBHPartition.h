//
//  ZBHPartition.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBHSubIcon;

@interface ZBHPartition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double partitionIdentifier;
@property (nonatomic, strong) ZBHSubIcon *subIcon;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double count;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
