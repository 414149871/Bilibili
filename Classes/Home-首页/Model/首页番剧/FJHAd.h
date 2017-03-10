//
//  FJHAd.h
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FJHAd : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *head;
@property (nonatomic, strong) NSArray *body;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
