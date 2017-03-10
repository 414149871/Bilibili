//
//  Body.h
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Body : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double play;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *param;
@property (nonatomic, strong) NSString *index;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *gotoProperty;
@property (nonatomic, assign) double areaId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double danmaku;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *mtime;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *face;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
