//
//  YOSWineModels.m
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWineryModel.h"
#import "YOSWineModel.h"


@interface YOSWineryModel ()

@property (strong,nonatomic) NSMutableArray* redWines;
@property (strong,nonatomic) NSMutableArray* whiteWines;
@property (strong,nonatomic) NSMutableArray* otherWines;

@end

@implementation YOSWineryModel


-(YOSWineModel *) redWineAtIndex: (int) index {
    return [self.redWines objectAtIndex:index];
}


-(YOSWineModel *) whiteWineAtIndex: (int) index {
    return [self.whiteWines objectAtIndex:index];
}


-(YOSWineModel *) otherWineAtIndex: (int) index {
    return [self.otherWines objectAtIndex:index];
}


-(id) init{
    
    
    if (self = [super init]) {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baccusapp.herokuapp.com/wines"] ];
        NSURLResponse *response = [[NSURLResponse alloc] init];
        NSError *err;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&err];
        
        if (data) {
            
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions
                                                                     error:&err];
            if (JSONObjects) {
                
                for (NSDictionary *dict in JSONObjects) {
                    
                    YOSWineModel *wine =[[YOSWineModel alloc] initWithDictionary:dict];
                    
                    if ([wine.type isEqualToString:RED_WINE_KEY]) {
                        
                        if (!self.redWines) {
                            self.redWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.redWines addObject:wine];
                        }
                        
                    } else if ([wine.type isEqualToString:WHITE_WINE_KEY]) {
                        
                        if (!self.whiteWines) {
                            self.whiteWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.whiteWines addObject:wine];
                        }
                    } else {
                        
                        if (!self.otherWines) {
                            self.otherWines = [NSMutableArray arrayWithObject:wine];
                        } else {
                            [self.otherWines addObject:wine];
                        }
                    }
                }
                NSLog(@" cantidad de vinos blanco: %@",self.whiteWines);
                
            } else {
                NSLog(@"Error al parsear el JSON :%@ ", err.localizedDescription);
            }
            
        } else {
            NSLog(@"Error al cargar los datos del servidor:%@ ", err.localizedDescription);
        }
    }
    
    
    return self;
}

#pragma mark -  Getter property

-(int) redWineCount {
    return [self.redWines count];
}


-(int) whiteWineCount {
    return [self.whiteWines count];
}


-(int) otherWineCount {
    return [self.otherWines count];
}

@end
