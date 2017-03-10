//
//  FJHHead.h
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FJHHead : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double headIdentifier;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double isAd;
@property (nonatomic, strong) NSString *pubTime;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
