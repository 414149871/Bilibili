//
//  ZBHPartition.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHPartition.h"
#import "ZBHSubIcon.h"


NSString *const kZBHPartitionId = @"id";
NSString *const kZBHPartitionSubIcon = @"sub_icon";
NSString *const kZBHPartitionArea = @"area";
NSString *const kZBHPartitionName = @"name";
NSString *const kZBHPartitionCount = @"count";


@interface ZBHPartition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHPartition

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
            self.partitionIdentifier = [[self objectOrNilForKey:kZBHPartitionId fromDictionary:dict] doubleValue];
            self.subIcon = [ZBHSubIcon modelObjectWithDictionary:[dict objectForKey:kZBHPartitionSubIcon]];
            self.area = [self objectOrNilForKey:kZBHPartitionArea fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZBHPartitionName fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kZBHPartitionCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.partitionIdentifier] forKey:kZBHPartitionId];
    [mutableDict setValue:[self.subIcon dictionaryRepresentation] forKey:kZBHPartitionSubIcon];
    [mutableDict setValue:self.area forKey:kZBHPartitionArea];
    [mutableDict setValue:self.name forKey:kZBHPartitionName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kZBHPartitionCount];

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

    self.partitionIdentifier = [aDecoder decodeDoubleForKey:kZBHPartitionId];
    self.subIcon = [aDecoder decodeObjectForKey:kZBHPartitionSubIcon];
    self.area = [aDecoder decodeObjectForKey:kZBHPartitionArea];
    self.name = [aDecoder decodeObjectForKey:kZBHPartitionName];
    self.count = [aDecoder decodeDoubleForKey:kZBHPartitionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_partitionIdentifier forKey:kZBHPartitionId];
    [aCoder encodeObject:_subIcon forKey:kZBHPartitionSubIcon];
    [aCoder encodeObject:_area forKey:kZBHPartitionArea];
    [aCoder encodeObject:_name forKey:kZBHPartitionName];
    [aCoder encodeDouble:_count forKey:kZBHPartitionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHPartition *copy = [[ZBHPartition alloc] init];
    
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
