//
//  NRDBanner.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDBanner.h"


NSString *const kNRDBannerLink = @"link";
NSString *const kNRDBannerTitle = @"title";
NSString *const kNRDBannerImg = @"img";
NSString *const kNRDBannerRemark = @"remark";


@interface NRDBanner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDBanner

@synthesize link = _link;
@synthesize title = _title;
@synthesize img = _img;
@synthesize remark = _remark;


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
            self.link = [self objectOrNilForKey:kNRDBannerLink fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNRDBannerTitle fromDictionary:dict];
            self.img = [self objectOrNilForKey:kNRDBannerImg fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kNRDBannerRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.link forKey:kNRDBannerLink];
    [mutableDict setValue:self.title forKey:kNRDBannerTitle];
    [mutableDict setValue:self.img forKey:kNRDBannerImg];
    [mutableDict setValue:self.remark forKey:kNRDBannerRemark];

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

    self.link = [aDecoder decodeObjectForKey:kNRDBannerLink];
    self.title = [aDecoder decodeObjectForKey:kNRDBannerTitle];
    self.img = [aDecoder decodeObjectForKey:kNRDBannerImg];
    self.remark = [aDecoder decodeObjectForKey:kNRDBannerRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_link forKey:kNRDBannerLink];
    [aCoder encodeObject:_title forKey:kNRDBannerTitle];
    [aCoder encodeObject:_img forKey:kNRDBannerImg];
    [aCoder encodeObject:_remark forKey:kNRDBannerRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDBanner *copy = [[NRDBanner alloc] init];
    
    if (copy) {

        copy.link = [self.link copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
    }
    
    return copy;
}


@end
