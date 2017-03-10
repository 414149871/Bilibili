//
//  NRDEntranceIcons.h
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NRDEntranceIcon;

@interface NRDEntranceIcons : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double entranceIconsIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NRDEntranceIcon *entranceIcon;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
