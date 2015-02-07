//
//  YOSWineModel.m
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import "YOSWineModel.h"

@implementation YOSWineModel


#pragma mark - Class methods

+(id)wineWithName:(NSString *) aName
  wineCompanyName:(NSString *) aWineCompanyName
             type:(NSString *) aType
          origin :(NSString *) aOrigin
           grapes:(NSArray *)  arrayOfGrapes
       webCompany:(NSURL *)    aURL
            notes:(NSString *) aNotes
           rating:(int) aRating
          photoURL:(NSURL *) aPhotoURL{
    
    return [[self alloc ] initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:aOrigin
                                grapes:arrayOfGrapes
                            webCompany:aURL
                                 notes:aNotes
                                rating:aRating
                                 photoURL:aPhotoURL];
    
}


+(id)wineWithName:(NSString *) aName
  wineCompanyName:(NSString *) aWineCompanyName
             type:(NSString *) aType
           origin:(NSString *) aOrigin{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:aOrigin];
    
    
}


// Custom photo getter
-(UIImage *) photo {
    
    // Carga perezosa
    if (!_photo) {
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    return _photo;
}


// Inicializador designado

#pragma mark - Init

-(id)initWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *) aType
          origin :(NSString *) aOrigin
           grapes:(NSArray *)  arrayOfGrapes
       webCompany:(NSURL *)   aURL
            notes: (NSString *) aNotes
           rating: (int) aRating
            photoURL:(NSURL *) aPhotoURL{
    
    
    if (self = [super init]){
        
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = aOrigin;
        _grapes = arrayOfGrapes;
        _webCompany = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photoURL = aPhotoURL ;
    }
    
    return self;
}


-(id)initWithName:(NSString *) aName
  wineCompanyName:(NSString *) aWineCompanyName
             type:(NSString *) aType
           origin:(NSString *) aOrigin{
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:aOrigin
                       grapes:nil
                   webCompany:nil
                        notes:nil
                       rating:NO_RATING
                        photoURL: nil];
    
    
}



// Initializers of convenience

-(id)initWithDictionary:(NSDictionary *) aDictionary {
    
    return [self initWithName:[aDictionary objectForKey:@"name"]
              wineCompanyName:[aDictionary objectForKey:@"wineCompanyName"]
                         type:[aDictionary objectForKey:@"type"]
                       origin:[aDictionary objectForKey:@"origin"]
                       grapes:[self extractGrapesFromJSONArray:[aDictionary objectForKey:@"grapes"]]
                   webCompany:[NSURL URLWithString:[aDictionary objectForKey:@"wineCompanyWeb"]]
                        notes:[aDictionary objectForKey:@"notes"]
                       rating:[[aDictionary objectForKey:@"rating"] intValue]
                     photoURL:[NSURL URLWithString:[aDictionary objectForKey:@"picture"]]];
    
    
}



-(NSArray *) extractGrapesFromJSONArray:(NSArray *) JSONArray {
    
    NSMutableArray *grapes = [NSMutableArray arrayWithCapacity:[JSONArray count]];

    for (NSDictionary *dict in JSONArray) {
        
        [grapes addObject:[dict objectForKey:@"grape"]];
        
    }
    
    return grapes;
    
}



-(NSDictionary *) proxyForJSON {
    
    return @{@"name"           :self.name,
             @"wineCompanyName":self.wineCompanyName,
             @"type"           :self.type,
             @"orgin"          :self.origin,
             @"grapes"         :self.grapes,
             @"wineCompanyWeb" :self.webCompany,
             @"notes"          :self.notes,
             @"rating"         :@(self.rating),
             @"picture"        :[self.photoURL path]
             
             };
}



@end
