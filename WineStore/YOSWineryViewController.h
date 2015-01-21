//
//  YOSTableViewController.h
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSWineryModel.h"
#import "YOSWineViewController.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2


@interface YOSWineryViewController : UITableViewController

@property (nonatomic,strong) YOSWineryModel* model;

-(id)initWithModel: (YOSWineryModel*) model style:(UITableViewStyle) style;

@end
