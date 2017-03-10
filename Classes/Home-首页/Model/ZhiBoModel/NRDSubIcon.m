//
//  NRDSubIcon.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDSubIcon.h"


NSString *const kNRDSubIconSrc = @"src";
NSString *const kNRDSubIconWidth = @"width";
NSString *const kNRDSubIconHeight = @"height";


@interface NRDSubIcon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDSubIcon

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
            self.src = [self objectOrNilForKey:kNRDSubIconSrc fromDictionary:dict];
            self.width = [self objectOrNilForKey:kNRDSubIconWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kNRDSubIconHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kNRDSubIconSrc];
    [mutableDict setValue:self.width forKey:kNRDSubIconWidth];
    [mutableDict setValue:self.height forKey:kNRDSubIconHeight];

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

    self.src = [aDecoder decodeObjectForKey:kNRDSubIconSrc];
    self.width = [aDecoder decodeObjectForKey:kNRDSubIconWidth];
    self.height = [aDecoder decodeObjectForKey:kNRDSubIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kNRDSubIconSrc];
    [aCoder encodeObject:_width forKey:kNRDSubIconWidth];
    [aCoder encodeObject:_height forKey:kNRDSubIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDSubIcon *copy = [[NRDSubIcon alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
