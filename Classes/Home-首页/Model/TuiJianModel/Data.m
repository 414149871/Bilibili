//
//  Data.m
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Banner.h"
#import "Ext.h"
#import "Body.h"


NSString *const kDataBanner = @"banner";
NSString *const kDataStyle = @"style";
NSString *const kDataExt = @"ext";
NSString *const kDataTitle = @"title";
NSString *const kDataParam = @"param";
NSString *const kDataType = @"type";
NSString *const kDataBody = @"body";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize banner = _banner;
@synthesize style = _style;
@synthesize ext = _ext;
@synthesize title = _title;
@synthesize param = _param;
@synthesize type = _type;
@synthesize body = _body;


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
            self.banner = [Banner modelObjectWithDictionary:[dict objectForKey:kDataBanner]];
            self.style = [self objectOrNilForKey:kDataStyle fromDictionary:dict];
            self.ext = [Ext modelObjectWithDictionary:[dict objectForKey:kDataExt]];
            self.title = [self objectOrNilForKey:kDataTitle fromDictionary:dict];
            self.param = [self objectOrNilForKey:kDataParam fromDictionary:dict];
            self.type = [self objectOrNilForKey:kDataType fromDictionary:dict];
    NSObject *receivedBody = [dict objectForKey:kDataBody];
    NSMutableArray *parsedBody = [NSMutableArray array];
    if ([receivedBody isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBody) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBody addObject:[Body modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBody isKindOfClass:[NSDictionary class]]) {
       [parsedBody addObject:[Body modelObjectWithDictionary:(NSDictionary *)receivedBody]];
    }

    self.body = [NSArray arrayWithArray:parsedBody];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.banner dictionaryRepresentation] forKey:kDataBanner];
    [mutableDict setValue:self.style forKey:kDataStyle];
    [mutableDict setValue:[self.ext dictionaryRepresentation] forKey:kDataExt];
    [mutableDict setValue:self.title forKey:kDataTitle];
    [mutableDict setValue:self.param forKey:kDataParam];
    [mutableDict setValue:self.type forKey:kDataType];
    NSMutableArray *tempArrayForBody = [NSMutableArray array];
    for (NSObject *subArrayObject in self.body) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBody addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBody addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBody] forKey:kDataBody];

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

    self.banner = [aDecoder decodeObjectForKey:kDataBanner];
    self.style = [aDecoder decodeObjectForKey:kDataStyle];
    self.ext = [aDecoder decodeObjectForKey:kDataExt];
    self.title = [aDecoder decodeObjectForKey:kDataTitle];
    self.param = [aDecoder decodeObjectForKey:kDataParam];
    self.type = [aDecoder decodeObjectForKey:kDataType];
    self.body = [aDecoder decodeObjectForKey:kDataBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_banner forKey:kDataBanner];
    [aCoder encodeObject:_style forKey:kDataStyle];
    [aCoder encodeObject:_ext forKey:kDataExt];
    [aCoder encodeObject:_title forKey:kDataTitle];
    [aCoder encodeObject:_param forKey:kDataParam];
    [aCoder encodeObject:_type forKey:kDataType];
    [aCoder encodeObject:_body forKey:kDataBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.banner = [self.banner copyWithZone:zone];
        copy.style = [self.style copyWithZone:zone];
        copy.ext = [self.ext copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.param = [self.param copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
