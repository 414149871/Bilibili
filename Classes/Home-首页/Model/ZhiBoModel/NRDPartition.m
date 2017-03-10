//
//  NRDPartition.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDPartition.h"
#import "NRDSubIcon.h"


NSString *const kNRDPartitionId = @"id";
NSString *const kNRDPartitionSubIcon = @"sub_icon";
NSString *const kNRDPartitionArea = @"area";
NSString *const kNRDPartitionName = @"name";
NSString *const kNRDPartitionCount = @"count";


@interface NRDPartition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDPartition

@synthesize partitionIdentifier = _partitionIdentifier;
@synthesize subIcon = _subIcon;
@synthesize area = _area;
@synthesize name = _name;
@synthesize count = _count;


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
            self.partitionIdentifier = [[self objectOrNilForKey:kNRDPartitionId fromDictionary:dict] doubleValue];
            self.subIcon = [NRDSubIcon modelObjectWithDictionary:[dict objectForKey:kNRDPartitionSubIcon]];
            self.area = [self objectOrNilForKey:kNRDPartitionArea fromDictionary:dict];
            self.name = [self objectOrNilForKey:kNRDPartitionName fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kNRDPartitionCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.partitionIdentifier] forKey:kNRDPartitionId];
    [mutableDict setValue:[self.subIcon dictionaryRepresentation] forKey:kNRDPartitionSubIcon];
    [mutableDict setValue:self.area forKey:kNRDPartitionArea];
    [mutableDict setValue:self.name forKey:kNRDPartitionName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kNRDPartitionCount];

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

    self.partitionIdentifier = [aDecoder decodeDoubleForKey:kNRDPartitionId];
    self.subIcon = [aDecoder decodeObjectForKey:kNRDPartitionSubIcon];
    self.area = [aDecoder decodeObjectForKey:kNRDPartitionArea];
    self.name = [aDecoder decodeObjectForKey:kNRDPartitionName];
    self.count = [aDecoder decodeDoubleForKey:kNRDPartitionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_partitionIdentifier forKey:kNRDPartitionId];
    [aCoder encodeObject:_subIcon forKey:kNRDPartitionSubIcon];
    [aCoder encodeObject:_area forKey:kNRDPartitionArea];
    [aCoder encodeObject:_name forKey:kNRDPartitionName];
    [aCoder encodeDouble:_count forKey:kNRDPartitionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDPartition *copy = [[NRDPartition alloc] init];
    
    if (copy) {

        copy.partitionIdentifier = self.partitionIdentifier;
        copy.subIcon = [self.subIcon copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.count = self.count;
    }
    
    return copy;
}


@end
