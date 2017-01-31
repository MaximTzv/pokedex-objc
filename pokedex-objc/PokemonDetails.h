//
//  PokemonDetails.h
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/30/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataDict, NSString * __nullable errorMessage);

@interface PokemonDetails : NSObject

@property (strong, nonatomic) NSString *pokemonName;
@property (nonatomic) NSUInteger pokemonId;

-(void)downloadPokemonData:(nullable onComplete)completionHandler;

@end
