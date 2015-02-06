//
//  YOSWineModel.h
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NO_RATING -1

@interface YOSWineModel : NSObject

@property (strong, nonatomic)NSString *type;
@property (strong, nonatomic)UIImage *photo;
@property (strong, nonatomic) NSURL *webCompany;
@property (strong, nonatomic) NSString *notes;
@property (strong,nonatomic) NSString *origin;
@property (nonatomic) int rating; // 0 a 5
@property (strong, nonatomic) NSArray *grapes;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wineCompanyName;
@property (strong, nonatomic) NSURL *photoURL;



// Metodos de clases
// Constructores de conveniencia
+(id) wineWithName:(NSString *) aName
   wineCompanyName:(NSString *) aWineCompanyName
              type:(NSString *) aType
           origin :(NSString *) aOrigin
            grapes:(NSArray *)  arrayOfGrapes
        webCompany:(NSURL *)    aURL
             notes: (NSString *)aNotes
            rating: (int) aRating
             photoURL:(UIImage *) aPhotoURL;


+(id)wineWithName:(NSString *) aName
  wineCompanyName:(NSString *) aWineCompanyName
             type:(NSString *) aType
           origin:(NSString *) aOrigin;



// Metodos de Instancia
// Inicializador designado.
-(id)initWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *) aType
          origin :(NSString *) aOrigin
           grapes:(NSArray *)  arrayOfGrapes
       webCompany:(NSURL *)   aURL
            notes: (NSString *) aNotes
           rating: (int) aRating
            photoURL:(NSURL *) aPhotoURL;


// Inicializador de conveniencia.
-(id)initWithName:(NSString *) aName
  wineCompanyName:(NSString *) aWineCompanyName
             type:(NSString *) aType
           origin:(NSString *) aOrigin;

-(id)initWithDictionary:(NSDictionary *) aDictionary;



@end
