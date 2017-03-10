//
//  ZBHSubIcon.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHSubIcon.h"


NSString *const kZBHSubIconSrc = @"src";
NSString *const kZBHSubIconWidth = @"width";
NSString *const kZBHSubIconHeight = @"height";


@interface ZBHSubIcon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHSubIcon

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
            self.src = [self objectOrNilForKey:kZBHSubIconSrc fromDictionary:dict];
            self.width = [self objectOrNilForKey:kZBHSubIconWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kZBHSubIconHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kZBHSubIconSrc];
    [mutableDict setValue:self.width forKey:kZBHSubIconWidth];
    [mutableDict setValue:self.height forKey:kZBHSubIconHeight];

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

    self.src = [aDecoder decodeObjectForKey:kZBHSubIconSrc];
    self.width = [aDecoder decodeObjectForKey:kZBHSubIconWidth];
    self.height = [aDecoder decodeObjectForKey:kZBHSubIconHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kZBHSubIconSrc];
    [aCoder encodeObject:_width forKey:kZBHSubIconWidth];
    [aCoder encodeObject:_height forKey:kZBHSubIconHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHSubIcon *copy = [[ZBHSubIcon alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
