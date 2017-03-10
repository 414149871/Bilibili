//
//  NRDData.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDData.h"
#import "NRDBanner.h"
#import "NRDPartitions.h"
#import "NRDEntranceIcons.h"


NSString *const kNRDDataBanner = @"banner";
NSString *const kNRDDataPartitions = @"partitions";
NSString *const kNRDDataEntranceIcons = @"entranceIcons";


@interface NRDData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDData

@synthesize banner = _banner;
@synthesize partitions = _partitions;
@synthesize entranceIcons = _entranceIcons;


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
    NSObject *receivedNRDBanner = [dict objectForKey:kNRDDataBanner];
    NSMutableArray *parsedNRDBanner = [NSMutableArray array];
    if ([receivedNRDBanner isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNRDBanner) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNRDBanner addObject:[NRDBanner modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNRDBanner isKindOfClass:[NSDictionary class]]) {
       [parsedNRDBanner addObject:[NRDBanner modelObjectWithDictionary:(NSDictionary *)receivedNRDBanner]];
    }

    self.banner = [NSArray arrayWithArray:parsedNRDBanner];
    NSObject *receivedNRDPartitions = [dict objectForKey:kNRDDataPartitions];
    NSMutableArray *parsedNRDPartitions = [NSMutableArray array];
    if ([receivedNRDPartitions isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNRDPartitions) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNRDPartitions addObject:[NRDPartitions modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNRDPartitions isKindOfClass:[NSDictionary class]]) {
       [parsedNRDPartitions addObject:[NRDPartitions modelObjectWithDictionary:(NSDictionary *)receivedNRDPartitions]];
    }

    self.partitions = [NSArray arrayWithArray:parsedNRDPartitions];
    NSObject *receivedNRDEntranceIcons = [dict objectForKey:kNRDDataEntranceIcons];
    NSMutableArray *parsedNRDEntranceIcons = [NSMutableArray array];
    if ([receivedNRDEntranceIcons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNRDEntranceIcons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNRDEntranceIcons addObject:[NRDEntranceIcons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNRDEntranceIcons isKindOfClass:[NSDictionary class]]) {
       [parsedNRDEntranceIcons addObject:[NRDEntranceIcons modelObjectWithDictionary:(NSDictionary *)receivedNRDEntranceIcons]];
    }

    self.entranceIcons = [NSArray arrayWithArray:parsedNRDEntranceIcons];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForBanner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanner] forKey:kNRDDataBanner];
    NSMutableArray *tempArrayForPartitions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.partitions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPartitions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPartitions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPartitions] forKey:kNRDDataPartitions];
    NSMutableArray *tempArrayForEntranceIcons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.entranceIcons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEntranceIcons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEntranceIcons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEntranceIcons] forKey:kNRDDataEntranceIcons];

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

    self.banner = [aDecoder decodeObjectForKey:kNRDDataBanner];
    self.partitions = [aDecoder decodeObjectForKey:kNRDDataPartitions];
    self.entranceIcons = [aDecoder decodeObjectForKey:kNRDDataEntranceIcons];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_banner forKey:kNRDDataBanner];
    [aCoder encodeObject:_partitions forKey:kNRDDataPartitions];
    [aCoder encodeObject:_entranceIcons forKey:kNRDDataEntranceIcons];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDData *copy = [[NRDData alloc] init];
    
    if (copy) {

        copy.banner = [self.banner copyWithZone:zone];
        copy.partitions = [self.partitions copyWithZone:zone];
        copy.entranceIcons = [self.entranceIcons copyWithZone:zone];
    }
    
    return copy;
}


@end
