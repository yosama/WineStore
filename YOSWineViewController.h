//
//  YOSWineViewController.h
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSWineModel.h"

@interface YOSWineViewController : UIViewController

@property (strong, nonatomic)YOSWineModel *model;

-(id) initWithModel: (YOSWineModel *) aModel;

@end
