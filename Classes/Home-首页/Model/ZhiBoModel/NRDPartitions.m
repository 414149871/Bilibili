//
//  NRDPartitions.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDPartitions.h"
#import "NRDLives.h"
#import "NRDPartition.h"


NSString *const kNRDPartitionsLives = @"lives";
NSString *const kNRDPartitionsPartition = @"partition";


@interface NRDPartitions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDPartitions

@synthesize lives = _lives;
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
    NSObject *receivedNRDLives = [dict objectForKey:kNRDPartitionsLives];
    NSMutableArray *parsedNRDLives = [NSMutableArray array];
    if ([receivedNRDLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNRDLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNRDLives addObject:[NRDLives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNRDLives isKindOfClass:[NSDictionary class]]) {
       [parsedNRDLives addObject:[NRDLives modelObjectWithDictionary:(NSDictionary *)receivedNRDLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedNRDLives];
            self.partition = [NRDPartition modelObjectWithDictionary:[dict objectForKey:kNRDPartitionsPartition]];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kNRDPartitionsLives];
    [mutableDict setValue:[self.partition dictionaryRepresentation] forKey:kNRDPartitionsPartition];

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

    self.lives = [aDecoder decodeObjectForKey:kNRDPartitionsLives];
    self.partition = [aDecoder decodeObjectForKey:kNRDPartitionsPartition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lives forKey:kNRDPartitionsLives];
    [aCoder encodeObject:_partition forKey:kNRDPartitionsPartition];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDPartitions *copy = [[NRDPartitions alloc] init];
    
    if (copy) {

        copy.lives = [self.lives copyWithZone:zone];
        copy.partition = [self.partition copyWithZone:zone];
    }
    
    return copy;
}


@end
