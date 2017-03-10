//
//  ZBHData.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHData.h"
#import "ZBHRecommendData.h"


NSString *const kZBHDataRecommendData = @"recommend_data";


@interface ZBHData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHData

@synthesize recommendData = _recommendData;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.recommendData = [ZBHRecommendData modelObjectWithDictionary:[dict objectForKey:kZBHDataRecommendData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.recommendData dictionaryRepresentation] forKey:kZBHDataRecommendData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.recommendData = [aDecoder decodeObjectForKey:kZBHDataRecommendData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_recommendData forKey:kZBHDataRecommendData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHData *copy = [[ZBHData alloc] init];
    
    if (copy) {

        copy.recommendData = [self.recommendData copyWithZone:zone];
    }
    
    return copy;
}


@end
