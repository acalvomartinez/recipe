//
//  ViewController.m
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "ViewController.h"

#import "Recipe.h"
#import "Ingredient.h"
#import "Direction.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;
@property (nonatomic, strong) Recipe *recipe;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@end

@implementation ViewController

#pragma mark - lifecycle

- (Recipe *)recipe {
    if (!_recipe) _recipe = [self createRecipe];
    return _recipe;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self presentRecipe];
    
}

#pragma mark - recipe utils

- (Recipe *)createRecipe
{
    Recipe *recipe;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:@"favoriteRecipe"]) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"favoriteRecipe"];
        recipe= [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } else {
        NSArray *ingredients = @[[Ingredient ingredientWithName:@"Macaroni" amount:@"250gr"],
                                 [Ingredient ingredientWithName:@"Tomato" amount:@"300gr"],
                                 [Ingredient ingredientWithName:@"Chorizo" amount:@"300gr"]];
        
        NSArray *directions = @[[Direction directionWithText:@"Boil the macaroni"],
                                [Direction directionWithText:@"Add Tomato"],
                                [Direction directionWithText:@"Fry the chorizo"],
                                [Direction directionWithText:@"Mix all the ingredients"]];
        
        recipe = [Recipe recipeWithName:@"Macaroni with tomato"
                              imageName:@"macarrones"
                                 resume:@"A Mom's recipe"
                             difficulty:Hard
                            ingredients:ingredients
                             directions:directions];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:recipe];
        [userDefaults setObject:data forKey:@"favoriteRecipe"];
        [userDefaults synchronize];
    }
    
    return recipe;
    
   
}

- (void)presentRecipe {
    
    self.recipeImageView.image = [UIImage imageNamed:self.recipe.imageName];
    self.nameLabel.text = self.recipe.name;
    self.difficultyLabel.text = [self.recipe difficulty];
    
    UIFont* headlineFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    UIFont* bodyFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    NSMutableAttributedString *description = [[NSMutableAttributedString alloc] initWithString:self.recipe.resume attributes:@{NSFontAttributeName:bodyFont}];
    
    NSAttributedString *newLine = [[NSAttributedString alloc] initWithString:@"\n"];
    
    [description appendAttributedString:newLine];
    [description appendAttributedString:newLine];
    
    [description appendAttributedString:[[NSAttributedString alloc] initWithString:@"Ingredients" attributes:@{ NSFontAttributeName:headlineFont }]];
    
    [description appendAttributedString:newLine];
    [description appendAttributedString:newLine];
    
    for (Ingredient *ingredient in self.recipe.ingredients) {
        NSString *tabtext = [NSString stringWithFormat:@"\t%@", [ingredient description]];
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:tabtext attributes:@{NSFontAttributeName:bodyFont}];
        [text setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:bodyFont.pointSize]}
                      range:NSMakeRange(1, [ingredient.amount length])];
        
        [description appendAttributedString:text];
        [description appendAttributedString:newLine];
    }
    
    [description appendAttributedString:newLine];
    
    [description appendAttributedString:[[NSAttributedString alloc] initWithString:@"Directions" attributes:@{ NSFontAttributeName:headlineFont }]];
    
    [description appendAttributedString:newLine];
    [description appendAttributedString:newLine];
    
    for (Direction *direction in self.recipe.directions) {
        
        NSString *tabtext = [NSString stringWithFormat:@"\t%@", [direction description]];
        
        NSAttributedString *text = [[NSAttributedString alloc] initWithString:tabtext attributes:@{NSFontAttributeName:bodyFont}];
        [description appendAttributedString:text];
        [description appendAttributedString:newLine];
    }
    
    [self.descriptionTextView.textStorage appendAttributedString:description];
    
}

#



@end





















