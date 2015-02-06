//
//  YOSWineModels.h
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YOSWineModel.h"


@interface YOSWineryModel : NSObject

@property (readonly,nonatomic) int redWineCount;
@property (readonly,nonatomic) int whiteWineCount;
@property (readonly,nonatomic) int otherWineCount;

-(YOSWineModel *) redWineAtIndex: (int) index;
-(YOSWineModel *) whiteWineAtIndex: (int) index;
-(YOSWineModel *) otherWineAtIndex: (int) index;


@end
