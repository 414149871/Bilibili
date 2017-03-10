//
//  ZBXQSchedule.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZBXQSchedule : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double streamId;
@property (nonatomic, assign) double start;
@property (nonatomic, assign) double mid;
@property (nonatomic, strong) NSArray *manager;
@property (nonatomic, assign) double schId;
@property (nonatomic, assign) double cid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double metaId;
@property (nonatomic, strong) NSString *startAt;
@property (nonatomic, assign) double pendingMetaId;
@property (nonatomic, assign) double online;
@property (nonatomic, assign) double aid;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
