//
//  NamedEntity.m
//  Favorite Recipe
//
//  Created by Toni on 21/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "NamedEntity.h"

@implementation NamedEntity

+ (instancetype)entityWithName:(NSString *)name
{
    return [[self alloc] initWithName:name];
}

- (id)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = name;
    }
    
    return self;
}

-(NSString *)description {
    
    return [NSString stringWithFormat:@"%@", self.name];
}


#pragma mark - NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
}



@end
