//
//  PokemonDetails.m
//  pokedex-objc
//
//  Created by Maxim Tzvetkov on 1/30/17.
//  Copyright © 2017 Jericho Inc. All rights reserved.
//

#import "PokemonDetails.h"
#import "Constants.h"

@implementation PokemonDetails

-(void)downloadPokemonData:(onComplete)completionHandler {
    
    NSURL *url = [NSURL URLWithString:BASE_URL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *jsonPoke = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(jsonPoke, nil);
            } else {
                completionHandler(nil, @"Data is corrupt");
            }
        } else {
            NSLog(@"Network error %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server");
        }
    }] resume];
}

@end
