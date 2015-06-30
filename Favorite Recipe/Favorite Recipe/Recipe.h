//
//  Recipe.h
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RecipeDifficulty) {
    Easy = 1,
    Medium = 2,
    Hard = 3
};

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resume;
@property RecipeDifficulty difficulty;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSArray *directions;

+(instancetype) recipeWithName:(NSString *)name
                        resume:(NSString *)resume
                    difficulty:(RecipeDifficulty)difficulty
                   ingredients:(NSArray *)ingredients
                    directions:(NSArray *)directions;

-(id) initWithName:(NSString *)name
            resume:(NSString *)resume
        difficulty:(RecipeDifficulty)difficulty
       ingredients:(NSArray *)ingredients
        directions:(NSArray *)directions;

-(void)print;

@end
