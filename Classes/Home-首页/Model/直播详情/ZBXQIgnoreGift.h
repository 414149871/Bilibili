//
//  ZBXQIgnoreGift.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZBXQIgnoreGift : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ignoreGiftIdentifier;
@property (nonatomic, assign) double num;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
