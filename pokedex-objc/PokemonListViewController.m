//
//  PokemonListViewController.m
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/30/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import "PokemonListViewController.h"
#import "PokemonDetails.h"
#import "Constants.h"

@interface PokemonListViewController ()

@property (strong, nonatomic) NSArray *details;
@property (strong, nonatomic) PokemonDetails *pokeDtls;

@end

@implementation PokemonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pokeDtls = [[PokemonDetails alloc] init];
    [self.pokeDtls downloadPokemonData:^(NSArray * _Nullable dataDict, NSString * _Nullable errorMessage) {
        
        NSMutableArray *pokemonsToDisplay = [[NSMutableArray alloc] init];
        
        if (dataDict) {
            
            //NSLog(@"Did we get here? %@", dataDict.debugDescription);
            
            for (NSDictionary *entry in dataDict) {
                
            }
            
        } else {
            // Show alert pop up
        }
    }];
}

@end











