//
//  ZBXQMeta.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBXQTagIds;

@interface ZBXQMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double typeid;
@property (nonatomic, strong) ZBXQTagIds *tagIds;
@property (nonatomic, strong) NSString *checkStatus;
@property (nonatomic, assign) double aid;
@property (nonatomic, strong) NSArray *tag;
@property (nonatomic, strong) NSString *metaDescription;
@property (nonatomic, strong) NSString *cover;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
