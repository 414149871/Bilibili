//
//  ZBXQToplist.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQToplist.h"


NSString *const kZBXQToplistName = @"name";
NSString *const kZBXQToplistType = @"type";


@interface ZBXQToplist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQToplist

@synthesize name = _name;
@synthesize type = _type;


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
            self.name = [self objectOrNilForKey:kZBXQToplistName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kZBXQToplistType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kZBXQToplistName];
    [mutableDict setValue:self.type forKey:kZBXQToplistType];

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

    self.name = [aDecoder decodeObjectForKey:kZBXQToplistName];
    self.type = [aDecoder decodeObjectForKey:kZBXQToplistType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kZBXQToplistName];
    [aCoder encodeObject:_type forKey:kZBXQToplistType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQToplist *copy = [[ZBXQToplist alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
