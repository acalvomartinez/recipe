//
//  Ingredient.m
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

+ (instancetype)ingredientWithName:(NSString *)name
                            amount:(NSString *)amount {
    
    return [[self alloc] initWithName:name
                               amount:amount];
}

- (instancetype)initWithName:(NSString *)name
                      amount:(NSString *)amount {
    
    if (self = [super initWithName:name]) {
        _amount = amount;
    }
    
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.amount, self.name];
}

#pragma mark - NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.amount = [aDecoder decodeObjectForKey:@"amount"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.amount forKey:@"amount"];
}


@end
