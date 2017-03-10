//
//  FJHList.h
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FJHList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isFinish;
@property (nonatomic, assign) double seasonId;
@property (nonatomic, assign) double watchingCount;
@property (nonatomic, assign) double pubTime;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *favourites;
@property (nonatomic, strong) NSString *newestEpIndex;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, assign) double seasonStatus;
@property (nonatomic, assign) double lastTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
