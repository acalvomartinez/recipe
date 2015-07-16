//
//  SetCard.h
//  Matchismo
//
//  Created by Toni on 9/7/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Card.h"

typedef NS_ENUM(NSUInteger, MatchismoSetColor) {
    MatchismoSetColorRed = 0,
    MatchismoSetColorGreen,
    MatchismoSetColorPurple,
    MatchismoSetColorCount
};

typedef NS_ENUM(NSUInteger, MatchismoSetShape) {
    MatchismoSetSymbolCircle = 0,
    MatchismoSetSymbolTriangle,
    MatchismoSetSymbolSquare,
    MatchismoSetShapeCount
};

typedef NS_ENUM(NSUInteger, MatchismoSetShading) {
    MatchismoSetShadingSolid = 0,
    MatchismoSetShadingOpen,
    MatchismoSetShadingShaded,
    MatchismoSetShadingCount
};

@interface SetCard : Card

@property (nonatomic) MatchismoSetShape shape;
@property (nonatomic) MatchismoSetColor color;
@property (nonatomic) NSUInteger value;
@property (nonatomic) MatchismoSetShading shade;

+ (NSUInteger)maxValue;

@end
