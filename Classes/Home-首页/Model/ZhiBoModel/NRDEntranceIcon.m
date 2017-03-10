//
//  NRDEntranceIcon.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDEntranceIcon.h"


NSString *const kNRDEntranceIconSrc = @"src";
NSString *const kNRDEntranceIconWidth = @"width";
NSString *const kNRDEntranceIconHeight = @"height";


@interface NRDEntranceIcon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDEntranceIcon

@synthesize src = _src;
@synthesize width = _width;
@synthesize height = _height;


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
            self.src = [self objectOrNilForKey:kNRDEntranceIconSrc fromDictionary:dict];
            self.width = [self objectOrNilForKey:kNRDEntranceIconWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kNRDEntranceIconHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kNRDEntranceIconSrc];
    [mutableDict setValue:self.width forKey:kNRDEntranceIconWidth];
    [mutableDict setValue:self.height forKey:kNRDEntranceIconHeight];

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

    self.src = [aDecoder decodeObjectForKey:kNRDEntranceIconSrc];
    self.width = [aDecoder decodeObjectForKey:kNRDEntranceIconWidth];
    self.height = [aDecoder decodeObjectForKey:kNRDEntranceIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kNRDEntranceIconSrc];
    [aCoder encodeObject:_width forKey:kNRDEntranceIconWidth];
    [aCoder encodeObject:_height forKey:kNRDEntranceIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDEntranceIcon *copy = [[NRDEntranceIcon alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
