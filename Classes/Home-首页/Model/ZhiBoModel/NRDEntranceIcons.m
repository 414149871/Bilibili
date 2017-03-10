//
//  NRDEntranceIcons.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDEntranceIcons.h"
#import "NRDEntranceIcon.h"


NSString *const kNRDEntranceIconsId = @"id";
NSString *const kNRDEntranceIconsName = @"name";
NSString *const kNRDEntranceIconsEntranceIcon = @"entrance_icon";


@interface NRDEntranceIcons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDEntranceIcons

@synthesize entranceIconsIdentifier = _entranceIconsIdentifier;
@synthesize name = _name;
@synthesize entranceIcon = _entranceIcon;


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
            self.entranceIconsIdentifier = [[self objectOrNilForKey:kNRDEntranceIconsId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kNRDEntranceIconsName fromDictionary:dict];
            self.entranceIcon = [NRDEntranceIcon modelObjectWithDictionary:[dict objectForKey:kNRDEntranceIconsEntranceIcon]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.entranceIconsIdentifier] forKey:kNRDEntranceIconsId];
    [mutableDict setValue:self.name forKey:kNRDEntranceIconsName];
    [mutableDict setValue:[self.entranceIcon dictionaryRepresentation] forKey:kNRDEntranceIconsEntranceIcon];

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

    self.entranceIconsIdentifier = [aDecoder decodeDoubleForKey:kNRDEntranceIconsId];
    self.name = [aDecoder decodeObjectForKey:kNRDEntranceIconsName];
    self.entranceIcon = [aDecoder decodeObjectForKey:kNRDEntranceIconsEntranceIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_entranceIconsIdentifier forKey:kNRDEntranceIconsId];
    [aCoder encodeObject:_name forKey:kNRDEntranceIconsName];
    [aCoder encodeObject:_entranceIcon forKey:kNRDEntranceIconsEntranceIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDEntranceIcons *copy = [[NRDEntranceIcons alloc] init];
    
    if (copy) {

        copy.entranceIconsIdentifier = self.entranceIconsIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.entranceIcon = [self.entranceIcon copyWithZone:zone];
    }
    
    return copy;
}


@end
