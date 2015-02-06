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

@property (strong,nonatomic) NSArray* redWine;
@property (strong,nonatomic) NSArray* whiteWine;
@property (strong,nonatomic) NSArray* otherWine;

@end

@implementation YOSWineryModel


-(YOSWineModel *) redWineAtIndex: (int) index {
    return [self.redWine objectAtIndex:index];
}


-(YOSWineModel *) whiteWineAtIndex: (int) index {
    return [self.whiteWine objectAtIndex:index];
}


-(YOSWineModel *) otherWineAtIndex: (int) index {
    return [self.otherWine objectAtIndex:index];
}


-(id) init{
    
    
    if (self = [super init]){
    
        // Creamos unos vinos
        //Tintorro
        YOSWineModel *tintorro = [YOSWineModel wineWithName:@"Bembibre"
                                            wineCompanyName:@"Dominio de Tares"
                                                       type:@"tinto"
                                                     origin:@"El Bierzo"
                                                     grapes:@[@"Mencía"]
                                                 webCompany:[NSURL URLWithString:@"http://www.dominiodetares.com/web/esp/vino.php?id=4"]
                                                      notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                     rating:5
                                                      photo:[UIImage imageNamed:@"bembibre.jpg"]];
        // Albarino
        YOSWineModel *albarino = [YOSWineModel wineWithName:@"Zarate"
                                            wineCompanyName:@"Zarate"
                                                       type:@"While"
                                                     origin:@"Rias Bajas"
                                                     grapes:@[@"Albarinio"]
                                                 webCompany:[NSURL URLWithString:@"http://bodegas-zarate.com/productos/vinos/albarino-zarate/"]
                                                      notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                     rating:4
                                                      photo:[UIImage imageNamed:@"zarate.gif"]];
        
        // Champan
        YOSWineModel *champan = [YOSWineModel wineWithName:@"Contes de Champagne"
                                           wineCompanyName:@"Champagne Taittinger"
                                                      type:@"other"
                                                    origin:@"Champagne"
                                                    grapes:@[@"Chardonnay"]
                                                webCompany:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                     notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                    rating:5
                                                     photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        
        self.redWine = @[tintorro];
        self.whiteWine = @[albarino];
        self.otherWine = @[champan];
    }
    
    
    return self;
}

#pragma mark -  Getter property

-(int) redWineCount {
    return [self.redWine count];
}


-(int) whiteWineCount {
    return [self.whiteWine count];
}


-(int) otherWineCount {
    return [self.otherWine count];
}

@end
