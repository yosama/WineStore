//
//  YOSTableViewController.m
//  WineStore
//
//  Created by Yosnier on 14/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWineryViewController.h"
#import "YOSWineViewController.h"

@interface YOSWineryViewController ()

@end

@implementation YOSWineryViewController


-(id)initWithModel: (YOSWineryModel*) model style:(UITableViewStyle) style {
    
    if (self = [super initWithStyle:style]) {
        
        _model = model;
       self.title = @"Wine Store";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Cantidad de secciones que devuelvo.
    return 3;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == RED_WINE_SECTION) {
        return @"RED WINE";
    } if (section == WHITE_WINE_SECTION) {
        return @"WHITE WINE";
    } else {
        return @"OTHER WINE";
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == RED_WINE_SECTION) {
        return self.model.redWineCount;
        
    } if (section == WHITE_WINE_SECTION) {
        return  self.model.whiteWineCount;
    } else {
        return  self.model.otherWineCount;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"wineCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // Averiguar de que modelo de vino nos estan hablando
    YOSWineModel *wines = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        
        wines = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wines = [self.model whiteWineAtIndex:indexPath.row];
    } else {
        wines = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // Sincronizar celda > modelo
    cell.imageView.image = wines.photo;
    cell.textLabel.text = wines.name;
    cell.detailTextLabel.text = wines.wineCompanyName;
    
    return cell;
}



#pragma mark - Table Delegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar de que vino se trata
    YOSWineModel *wine = [self findWineForIndexPath:indexPath];
    
    [self.delegate wineSelected:self wineTouch: wine];
    
    //Create Notification
    NSNotification *notifify = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                             object:self
                                                           userInfo:@{WINE_KEY:wine}];

    [NSNotificationCenter.defaultCenter postNotification:notifify];
    
    [self saveTouchedWineAtSection:indexPath.section
                               row:indexPath.row];
    

}


#pragma mark - Utils

-(YOSWineModel *) findWineForIndexPath:(NSIndexPath*) anIndexPath {
    
    YOSWineModel *wine;
    
    if (anIndexPath.section == RED_WINE_SECTION) {
        
        wine = [self.model redWineAtIndex:anIndexPath.row];
        
    } else if (anIndexPath.section == WHITE_WINE_SECTION) {
        
        wine = [self.model whiteWineAtIndex:anIndexPath.row];
        
    } else {
        wine = [self.model otherWineAtIndex:anIndexPath.row];
    }
    
    return wine;
}


#pragma mark - NSUserDefaults


- (NSDictionary *) setWineDefaults {
    
    //
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    // Create dictionary
    NSDictionary *coordsDict =@{ SECTION_KEY:@(RED_WINE_SECTION), ROW_KEY:@0};
    
    [userDefault setObject:coordsDict
                    forKey:LAST_TOUCHED_WINE];
    
    [userDefault synchronize];
    
    return coordsDict;
}



-(void) saveTouchedWineAtSection: (NSInteger) aSection row: (NSInteger) aRow {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:@{SECTION_KEY:@(aSection), ROW_KEY:@(aRow)}
                    forKey:LAST_TOUCHED_WINE];
    
    [userDefault synchronize];
    
}



- (YOSWineModel *) lastTouchedWine {
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
   coords = [userDefault objectForKey:LAST_TOUCHED_WINE];
    
    if (!coords) {
        [self setWineDefaults];
    }
    
    indexPath  = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue]
                                    inSection:[[coords objectForKey:SECTION_KEY] integerValue] ];

    return [self findWineForIndexPath:indexPath];
    
}





@end
