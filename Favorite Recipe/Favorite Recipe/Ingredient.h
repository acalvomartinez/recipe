//
//  Ingredient.h
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NamedEntity.h"

@interface Ingredient : NamedEntity <NSCoding>

@property (nonatomic, strong) NSString *amount;

+(instancetype) ingredientWithName:(NSString *)name
                            amount:(NSString *)amount;

-(instancetype) initWithName:(NSString *)name
                      amount:(NSString *)amount;

@end
