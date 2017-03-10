//
//  ZBHRecommendData.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHRecommendData.h"
#import "ZBHLives.h"
#import "ZBHBannerData.h"
#import "ZBHPartition.h"


NSString *const kZBHRecommendDataLives = @"lives";
NSString *const kZBHRecommendDataBannerData = @"banner_data";
NSString *const kZBHRecommendDataPartition = @"partition";


@interface ZBHRecommendData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHRecommendData

@synthesize lives = _lives;
@synthesize bannerData = _bannerData;
@synthesize partition = _partition;


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
    NSObject *receivedZBHLives = [dict objectForKey:kZBHRecommendDataLives];
    NSMutableArray *parsedZBHLives = [NSMutableArray array];
    if ([receivedZBHLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBHLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBHLives addObject:[ZBHLives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBHLives isKindOfClass:[NSDictionary class]]) {
       [parsedZBHLives addObject:[ZBHLives modelObjectWithDictionary:(NSDictionary *)receivedZBHLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedZBHLives];
    NSObject *receivedZBHBannerData = [dict objectForKey:kZBHRecommendDataBannerData];
    NSMutableArray *parsedZBHBannerData = [NSMutableArray array];
    if ([receivedZBHBannerData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBHBannerData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBHBannerData addObject:[ZBHBannerData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBHBannerData isKindOfClass:[NSDictionary class]]) {
       [parsedZBHBannerData addObject:[ZBHBannerData modelObjectWithDictionary:(NSDictionary *)receivedZBHBannerData]];
    }

    self.bannerData = [NSArray arrayWithArray:parsedZBHBannerData];
            self.partition = [ZBHPartition modelObjectWithDictionary:[dict objectForKey:kZBHRecommendDataPartition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLives = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lives) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLives addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLives addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kZBHRecommendDataLives];
    NSMutableArray *tempArrayForBannerData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bannerData) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBannerData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBannerData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBannerData] forKey:kZBHRecommendDataBannerData];
    [mutableDict setValue:[self.partition dictionaryRepresentation] forKey:kZBHRecommendDataPartition];

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

    self.lives = [aDecoder decodeObjectForKey:kZBHRecommendDataLives];
    self.bannerData = [aDecoder decodeObjectForKey:kZBHRecommendDataBannerData];
    self.partition = [aDecoder decodeObjectForKey:kZBHRecommendDataPartition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lives forKey:kZBHRecommendDataLives];
    [aCoder encodeObject:_bannerData forKey:kZBHRecommendDataBannerData];
    [aCoder encodeObject:_partition forKey:kZBHRecommendDataPartition];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHRecommendData *copy = [[ZBHRecommendData alloc] init];
    
    if (copy) {

        copy.lives = [self.lives copyWithZone:zone];
        copy.bannerData = [self.bannerData copyWithZone:zone];
        copy.partition = [self.partition copyWithZone:zone];
    }
    
    return copy;
}


@end
