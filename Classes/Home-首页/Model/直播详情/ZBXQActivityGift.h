//
//  ZBXQActivityGift.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZBXQActivityGift : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *gifUrl;
@property (nonatomic, assign) double activityGiftIdentifier;
@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
