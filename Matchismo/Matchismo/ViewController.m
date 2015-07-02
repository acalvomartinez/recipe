//
//  ViewController.m
//  Matchismo
//
//  Created by Toni on 02/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "ViewController.h"

#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"

@interface ViewController ()

@property (strong, nonatomic) Deck *deck;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;

@end

@implementation ViewController

- (void)setFlipsCount:(int)flipCount {
    
    _flipsCount = flipCount;
    
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipsCount];
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)cardButtonTouched:(UIButton *)sender {
    
    if (!_deck) _deck = [self createDeck];
    
    if (self.flipsCount < 52) {
    
        if ([sender.currentTitle length] > 0) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        } else {
            Card *card = [_deck drawRandomCard];
            
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            
            self.flipsCount++;
        }
    } else {
        self.flipsLabel.text = @"No more cards!";
    }
}

@end
