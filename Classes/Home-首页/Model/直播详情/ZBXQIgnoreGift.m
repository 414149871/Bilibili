//
//  ZBXQIgnoreGift.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQIgnoreGift.h"


NSString *const kZBXQIgnoreGiftId = @"id";
NSString *const kZBXQIgnoreGiftNum = @"num";


@interface ZBXQIgnoreGift ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQIgnoreGift

@synthesize ignoreGiftIdentifier = _ignoreGiftIdentifier;
@synthesize num = _num;


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
            self.ignoreGiftIdentifier = [[self objectOrNilForKey:kZBXQIgnoreGiftId fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kZBXQIgnoreGiftNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ignoreGiftIdentifier] forKey:kZBXQIgnoreGiftId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kZBXQIgnoreGiftNum];

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

    self.ignoreGiftIdentifier = [aDecoder decodeDoubleForKey:kZBXQIgnoreGiftId];
    self.num = [aDecoder decodeDoubleForKey:kZBXQIgnoreGiftNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ignoreGiftIdentifier forKey:kZBXQIgnoreGiftId];
    [aCoder encodeDouble:_num forKey:kZBXQIgnoreGiftNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQIgnoreGift *copy = [[ZBXQIgnoreGift alloc] init];
    
    if (copy) {

        copy.ignoreGiftIdentifier = self.ignoreGiftIdentifier;
        copy.num = self.num;
    }
    
    return copy;
}


@end
