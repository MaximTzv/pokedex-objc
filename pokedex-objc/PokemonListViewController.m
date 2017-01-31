//
//  PokemonListViewController.m
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/30/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import "PokemonListViewController.h"
#import "PokemonCollectionViewCell.h"
#import "PokemonDetails.h"
#import "Constants.h"

@interface PokemonListViewController () <UICollectionViewDelegate,
                                            UICollectionViewDataSource,
                                            UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) PokemonDetails *pokeDtls;
@property (strong, nonatomic) NSArray *details;

@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@end

@implementation PokemonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pokeDtls = [[PokemonDetails alloc] init];
    self.details = [[NSArray alloc] init];
    
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    [self.pokeDtls downloadPokemonData:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errorMessage) {
        
        NSMutableArray *pokemonNames = [[NSMutableArray alloc] init];
        NSMutableDictionary *resultsDict = [[NSMutableDictionary alloc] init];
        
        if (dataDict) {
            
            resultsDict = [dataDict objectForKey:@"results"];
            
            // Due to restrictions of the Pokemon API, at a maximum of 20 pokemon are avaliable for download at a time
            
            for (NSDictionary *d in resultsDict) {
                PokemonDetails *pokemon = [[PokemonDetails alloc] init];
                pokemon.pokemonName = [d objectForKey:@"name"];
                [pokemonNames addObject:pokemon];
            }
            
            self.details = pokemonNames;
            [self updateCollectionData];
        } else {
            // Show alert pop up
        }
    }];
}

- (void)updateCollectionData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collection reloadData];
    });
}

#pragma mark - Collection view methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.details count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PokemonCollectionViewCell *pCell = (PokemonCollectionViewCell *)[self.collection dequeueReusableCellWithReuseIdentifier:@"PokeCell" forIndexPath:indexPath];
    
    if (!pCell) {
        pCell = [[PokemonCollectionViewCell alloc] init];
    }
    
    return pCell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PokemonDetails *poke = [self.details objectAtIndex:indexPath.row];
    PokemonCollectionViewCell *pokeCell = (PokemonCollectionViewCell*)cell;
    [pokeCell updateUI:poke];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.collection.frame.size.width, 50);
}

@end











