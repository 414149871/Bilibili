//
//  Banner.h
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Banner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *top;
@property (nonatomic, strong) NSArray *bottom;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
