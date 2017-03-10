//
//  ZBXQCoinType.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQCoinType.h"


NSString *const kZBXQCoinTypeGold = @"gold";
NSString *const kZBXQCoinTypeSilver = @"silver";


@interface ZBXQCoinType ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQCoinType

@synthesize gold = _gold;
@synthesize silver = _silver;


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
            self.gold = [self objectOrNilForKey:kZBXQCoinTypeGold fromDictionary:dict];
            self.silver = [self objectOrNilForKey:kZBXQCoinTypeSilver fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.gold forKey:kZBXQCoinTypeGold];
    [mutableDict setValue:self.silver forKey:kZBXQCoinTypeSilver];

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

    self.gold = [aDecoder decodeObjectForKey:kZBXQCoinTypeGold];
    self.silver = [aDecoder decodeObjectForKey:kZBXQCoinTypeSilver];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_gold forKey:kZBXQCoinTypeGold];
    [aCoder encodeObject:_silver forKey:kZBXQCoinTypeSilver];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQCoinType *copy = [[ZBXQCoinType alloc] init];
    
    if (copy) {

        copy.gold = [self.gold copyWithZone:zone];
        copy.silver = [self.silver copyWithZone:zone];
    }
    
    return copy;
}


@end
