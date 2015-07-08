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
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@end

@implementation ViewController

#pragma mark - lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createRecipe];
    [self presentRecipe];
    
}

#pragma mark - recipe utils

- (void)createRecipe
{
    NSArray *ingredients = @[[Ingredient ingredientWithName:@"Macaroni" amount:@"250gr"],
                             [Ingredient ingredientWithName:@"Tomato" amount:@"300gr"],
                             [Ingredient ingredientWithName:@"Chorizo" amount:@"300gr"]];
    
    NSArray *directions = @[[Direction directionWithText:@"Boil the macaroni"],
                            [Direction directionWithText:@"Add Tomato"],
                            [Direction directionWithText:@"Fry the chorizo"],
                            [Direction directionWithText:@"Mix all the ingredients"]];
    
    self.recipe = [Recipe recipeWithName:@"Macaroni with tomato"
                               imageName:@"macarrones"
                                  resume:@"A Mom's recipe"
                              difficulty:Hard
                             ingredients:ingredients
                              directions:directions];
}

- (void)presentRecipe {
    
    self.recipeImageView.image = [UIImage imageNamed:self.recipe.imageName];
    self.nameLabel.text = self.recipe.name;
    self.difficultyLabel.text = [self.recipe difficulty];
    
    float y = 10;
    
    UILabel *resumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, y, 288, 21)];
    resumeLabel.text = self.recipe.resume;
    
    [self.contentScrollView addSubview:resumeLabel];
    
    y += resumeLabel.frame.size.height + 10;
    
    UILabel *ingredientsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, y, 288, 21)];
    ingredientsTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    ingredientsTitleLabel.text = @"Ingredients";

    [self.contentScrollView addSubview:ingredientsTitleLabel];
    
    y += ingredientsTitleLabel.frame.size.height + 5;
    
    for (Ingredient *ingredient in self.recipe.ingredients) {
        UILabel *ingredientLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, y, 288, 21)];
        ingredientLabel.text = [ingredient description];
        [self.contentScrollView addSubview:ingredientLabel];
        y += ingredientLabel.frame.size.height + 5;
    }
    
    y += 5;
    
    UILabel *directionsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, y, 288, 21)];
    directionsTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    directionsTitleLabel.text = @"Directions";
    
    [self.contentScrollView addSubview:directionsTitleLabel];
    
    y += directionsTitleLabel.frame.size.height + 5;
    
    for (Direction *direction in self.recipe.directions) {
        UILabel *directionLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, y, 288, 21)];
        directionLabel.text = [direction description];
        [self.contentScrollView addSubview:directionLabel];
        y += directionLabel.frame.size.height + 5;
    }
    
    self.contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, y);
}

@end





















