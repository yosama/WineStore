//
//  YOSTableViewController.h
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSWineryModel.h"


#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2
#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

#define SECTION_KEY @"section"
#define ROW_KEY  @"row"
#define LAST_TOUCHED_WINE @"lastWine"


@class YOSWineryViewController;


@protocol YOSWineryViewControllerDelegate <NSObject>

-(void) wineSelected : (YOSWineryViewController *) sender wineTouch: (YOSWineModel *) aWine;

@end


@interface YOSWineryViewController : UITableViewController<YOSWineryViewControllerDelegate>

@property (nonatomic,strong) YOSWineryModel* model;

@property (weak) id<YOSWineryViewControllerDelegate> delegate;



//Designated
-(id)initWithModel: (YOSWineryModel*) model
             style:(UITableViewStyle) style;



- (YOSWineModel *) lastTouchedWine;



@end
