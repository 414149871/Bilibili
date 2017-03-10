//
//  FJHResult.h
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FJHPrevious, FJHAd;

@interface FJHResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) FJHPrevious *previous;
@property (nonatomic, strong) FJHAd *ad;
@property (nonatomic, strong) NSArray *serializing;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
