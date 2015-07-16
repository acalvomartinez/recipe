//
//  SetDeck.m
//  Matchismo
//
//  Created by Toni on 9/7/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck


- (instancetype)init {
    self = [super init];
    if (self) {
        for (int color = 0; color < MatchismoSetColorCount; color++) {
            for (int shape = 0; shape < MatchismoSetShapeCount; shape++) {
                for (int shade = 0; shade < MatchismoSetShadingCount; shade++) {
                    for (NSUInteger value = 1; value <= [SetCard maxValue]; value++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.color = (MatchismoSetColor)color;
                        card.shade = (MatchismoSetShading)shade;
                        card.shape = (MatchismoSetShape)shape;
                        card.value = value;
                        
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}
@end
