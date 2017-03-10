//
//  NRDPartitions.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NRDPartition;

@interface NRDPartitions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lives;
@property (nonatomic, strong) NRDPartition *partition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
