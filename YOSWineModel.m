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
            photo:(UIImage *) aPhoto{
    
    return [[self alloc ] initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:aOrigin
                                grapes:arrayOfGrapes
                            webCompany:aURL
                                 notes:aNotes
                                rating:aRating
                                 photo:aPhoto];
    
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
            photo:(UIImage *) aPhoto{
    
    
    if (self == [super init]){
        
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = aOrigin;
        _grapes = arrayOfGrapes;
        _webCompany = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
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
                        photo: nil];
    
    
}


@end
