//
//  YOSWebViewController.h
//  WineStore
//
//  Created by Yosnier on 10/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSWineModel.h"


@interface YOSWebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic)IBOutlet UIWebView *browserView;
@property(weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property(strong,nonatomic) YOSWineModel *model;

-(id) initWithModel:(YOSWineModel *)pModel;

@end
