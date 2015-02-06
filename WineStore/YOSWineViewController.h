//
//  YOSWineViewController.h
//  WineStore
//
//  Created by Yosnier on 19/12/14.
//  Copyright (c) 2014 yos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSWineModel.h"
#import "YOSWineryViewController.h"


@interface YOSWineViewController : UIViewController <UISplitViewControllerDelegate,YOSWineryViewControllerDelegate>

// Properties
@property (strong, nonatomic)YOSWineModel *model;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbType;
@property (weak, nonatomic) IBOutlet UILabel *lbNotes;
@property (weak, nonatomic) IBOutlet UILabel *lbOrigin;
@property (weak, nonatomic) IBOutlet UILabel *lbWineCompanyName;
@property (weak, nonatomic) IBOutlet UILabel *lbGrapes;
@property (weak, nonatomic) IBOutlet UIImageView *imPhotoView;
@property (strong, nonatomic)IBOutletCollection(UIImageView) NSArray *imRating;


-(id) initWithModel: (YOSWineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
