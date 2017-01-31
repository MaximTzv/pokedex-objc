//
//  PokemonCollectionViewCell.m
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/31/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import "PokemonCollectionViewCell.h"

@interface PokemonCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLbl;

@end

@implementation PokemonCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

-(void)updateUI:(nonnull PokemonDetails *)details {
    
    self.pokemonNameLbl.text = details.pokemonName;
    
}

@end
