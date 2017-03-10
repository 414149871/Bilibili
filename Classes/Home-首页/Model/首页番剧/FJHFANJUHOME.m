//
//  FJHFANJUHOME.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHFANJUHOME.h"
#import "FJHResult.h"


NSString *const kFJHFANJUHOMEMessage = @"message";
NSString *const kFJHFANJUHOMEResult = @"result";
NSString *const kFJHFANJUHOMECode = @"code";


@interface FJHFANJUHOME ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHFANJUHOME

@synthesize message = _message;
@synthesize result = _result;
@synthesize code = _code;


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
            self.message = [self objectOrNilForKey:kFJHFANJUHOMEMessage fromDictionary:dict];
            self.result = [FJHResult modelObjectWithDictionary:[dict objectForKey:kFJHFANJUHOMEResult]];
            self.code = [[self objectOrNilForKey:kFJHFANJUHOMECode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kFJHFANJUHOMEMessage];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kFJHFANJUHOMEResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kFJHFANJUHOMECode];

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

    self.message = [aDecoder decodeObjectForKey:kFJHFANJUHOMEMessage];
    self.result = [aDecoder decodeObjectForKey:kFJHFANJUHOMEResult];
    self.code = [aDecoder decodeDoubleForKey:kFJHFANJUHOMECode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kFJHFANJUHOMEMessage];
    [aCoder encodeObject:_result forKey:kFJHFANJUHOMEResult];
    [aCoder encodeDouble:_code forKey:kFJHFANJUHOMECode];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHFANJUHOME *copy = [[FJHFANJUHOME alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.result = [self.result copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
