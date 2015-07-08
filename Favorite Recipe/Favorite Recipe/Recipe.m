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


+ (instancetype)recipeWithName:(NSString *)name
                     imageName:(NSString *)imageName
                        resume:(NSString *)resume
                    difficulty:(RecipeDifficulty)difficulty
                   ingredients:(NSArray *)ingredients
                    directions:(NSArray *)directions {
    
    return [[self alloc] initWithName:name
                            imageName:imageName
                               resume:resume
                           difficulty:difficulty
                          ingredients:ingredients
                           directions:directions];
}

- (instancetype)initWithName:(NSString *)name
                   imageName:(NSString *)imageName
                      resume:(NSString *)resume
                  difficulty:(RecipeDifficulty)difficulty
                 ingredients:(NSArray *)ingredients
                  directions:(NSArray *)directions {
    
    if (self = [super init]) {
        _name = name;
        _imageName = imageName;
        _resume = resume;
        _recipeDifficulty = difficulty;
        _ingredients = ingredients;
        _directions = directions;
    }
    
    return self;
}

-(void)print {
    NSLog(@"Recipe");
    NSLog(@"%@",self.name);
    NSLog(@"%@",self.resume);
    
    NSLog(@"Ingredients");
    
    for (Ingredient *ingredient in self.ingredients) {
        NSLog(@"%@",[ingredient description]);
    }
    
    NSLog(@"Directions");
    
    NSInteger order = 1;
    
    for (Direction *direction in self.directions) {
        NSLog(@"%ld. %@", (long)order,[direction description]);
        order++;
    }
}

- (NSString *)difficulty {
    
    NSString *difficulty;
    
    switch (self.recipeDifficulty) {
        case Easy:
            difficulty =@"Easy";
            break;
        case Medium:
            difficulty =@"Medium";
            break;
        case Hard:
            difficulty =@"Hard";
            break;
        default:
            break;
    }
    
    return difficulty;
}

@end
