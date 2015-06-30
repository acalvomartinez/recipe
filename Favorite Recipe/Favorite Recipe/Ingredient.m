//
//  Ingredient.m
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

+(instancetype) ingredientWithName:(NSString *)name
                            amount:(NSString *)amount {
    
    return [[self alloc] initWithName:name
                               amount:amount];
}

-(id) initWithName:(NSString *)name
            amount:(NSString *)amount {
    
    if (self = [super init]) {
        _name = name;
        _amount = amount;
    }
    
    return self;
}

-(NSString *)description {
    
    return [NSString stringWithFormat:@"%@ %@", _amount, _name];
}

@end
