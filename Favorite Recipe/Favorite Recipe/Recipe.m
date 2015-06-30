//
//  Recipe.m
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Recipe.h"
#import "Ingredient.h"
#import "Direction.h"

@implementation Recipe


+(instancetype) recipeWithName:(NSString *)name
                        resume:(NSString *)resume
                    difficulty:(RecipeDifficulty)difficulty
                   ingredients:(NSArray *)ingredients
                    directions:(NSArray *)directions {
    
    return [[self alloc] initWithName:name
                               resume:resume
                           difficulty:difficulty
                          ingredients:ingredients
                           directions:directions];
}

-(id) initWithName:(NSString *)name
            resume:(NSString *)resume
        difficulty:(RecipeDifficulty)difficulty
       ingredients:(NSArray *)ingredients
        directions:(NSArray *)directions {
    
    if (self = [super init]) {
        _name = name;
        _resume = resume;
        _difficulty = difficulty;
        _ingredients = ingredients;
        _directions = directions;
    }
    
    return self;
}

-(void)print {
    NSLog(@"Recipe");
    NSLog(@"%@",_name);
    NSLog(@"%@",_resume);
    
    NSLog(@"Ingredients");
    
    for (Ingredient *ingredient in _ingredients) {
        NSLog(@"%@",[ingredient description]);
    }
    
    NSLog(@"Directions");
    
    NSInteger order = 1;
    
    for (Direction *direction in _directions) {
        NSLog(@"%ld. %@", (long)order,[direction description]);
        order++;
    }
}



@end
