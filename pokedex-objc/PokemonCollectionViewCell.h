//
//  PokemonCollectionViewCell.h
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/31/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonDetails.h"

@interface PokemonCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSString *pokemonName;

-(void)updateUI:(nonnull PokemonDetails *)details;

@end
