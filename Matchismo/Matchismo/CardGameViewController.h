//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Toni on 14/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck;  // abstract
- (NSAttributedString *)descriptionForCard:(Card *)card;  // abstract
- (NSAttributedString *)titleForCard:(Card *)card;    // abstract
- (UIImage *)backgroundImageForCard:(Card *)card; // abstract

@end
