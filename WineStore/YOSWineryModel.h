//
//  YOSWineModels.h
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

@import Foundation;
#import "YOSWineModel.h"

#define RED_WINE_KEY @"Tinto"
#define WHITE_WINE_KEY @"Blanco"
#define OTHER_WINE_KEY @"Rosado"



@interface YOSWineryModel : NSObject

@property (readonly,nonatomic) int redWineCount;
@property (readonly,nonatomic) int whiteWineCount;
@property (readonly,nonatomic) int otherWineCount;

-(YOSWineModel *) redWineAtIndex: (int) index;
-(YOSWineModel *) whiteWineAtIndex: (int) index;
-(YOSWineModel *) otherWineAtIndex: (int) index;


@end
