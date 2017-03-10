//
//  ZBXQHotWord.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZBXQHotWord : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double hotWordIdentifier;
@property (nonatomic, strong) NSString *words;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
